import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/modules/video_call_module/utils/signaling.dart';
import 'package:wakelock/wakelock.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoCallController extends GetxController {
  Signaling? _signaling;
  RxList<dynamic> _peers = [].obs;

  final _micOff = false.obs;

  get micOff => _micOff.value;

  set micOff(value) {
    _micOff.value = value;
  }

  final Rx<CallState> _callState = Rx(CallState.CallStateBye);

  CallState get callState => _callState.value;

  set callState(CallState value) {
    _callState.value = value;
  }

  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();
  var _inCalling = false.obs;
  Session? _session;
  String host = '10.224.56.200';
  String? selfId;

  List get peers => _peers.value;

  set peers(List<dynamic> value) {
    _peers.value = value;
  }

  get localRenderer => _localRenderer;

  get remoteRenderer => _remoteRenderer;

  Signaling? get signaling => _signaling;

  bool get inCalling => _inCalling.value;

  set inCalling(value) {
    _inCalling.value = value;
  }

  Session? get session => _session;

  @override
  void onInit() {
    _initRenderers();
    _connect();
    // TODO: implement onInit
    super.onInit();
  }

  _initRenderers() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();
  }

  void _connect() async {
    _signaling ??= Signaling(host)..connect();
    _signaling?.onSignalingStateChange = (SignalingState state) {
      switch (state) {
        case SignalingState.ConnectionClosed:
        case SignalingState.ConnectionError:
        case SignalingState.ConnectionOpen:
          break;
      }
    };

    _signaling?.onCallStateChange = (Session session, CallState state) {
      inCalling = false;
      Wakelock.disable();
      callState = state;
      micOff = _signaling!.micState();
      switch (state) {
        case CallState.CallStateNew:
          _session = session;
          break;
        case CallState.CallStateBye:
          localRenderer.srcObject = null;
          remoteRenderer.srcObject = null;
          _session = null;
          break;
        case CallState.CallStateInvite:
        case CallState.CallStateConnected:
          _session = session;
          inCalling = true;
          Wakelock.enable();
          break;
        case CallState.CallStateRinging:
          _session = session;
          break;
      }
    };

    _signaling?.onPeersUpdate = ((event) {
      selfId = event['self'];
      peers = event['peers'];
    });

    _signaling?.onLocalStream = ((stream) {
      localRenderer.srcObject = stream;
    });

    _signaling?.onAddRemoteStream = ((_, stream) {
      remoteRenderer.srcObject = stream;
    });

    _signaling?.onRemoveRemoteStream = ((_, stream) {
      remoteRenderer.srcObject = null;
    });
  }

  invitePeer(String peerId) async {
    if (_signaling != null && peerId != selfId) {
      _signaling?.invite(peerId);
    }
  }

  acceptCall() {
    _signaling?.acceptCall();
  }

  hangUp() {
    if (_session != null) {
      _signaling?.bye(_session!.sid);
    }
  }

  switchCamera() {
    _signaling?.switchCamera();
  }

  muteMic() {
    _signaling?.muteMic();
    micOff = _signaling?.micState();
  }

  @override
  void onClose() {
    _signaling?.close();
    localRenderer.dispose();
    remoteRenderer.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
