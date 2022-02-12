import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart' as S;
import 'package:pea_chat/app/data/provider/remote/api.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/utils/signaling.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/in_call.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/offer_call.dart';
import 'package:pea_chat/app/modules/landing_module/sub_module/video_call_module/widgets/ring_ring.dart';
import 'package:pea_chat/app/routes/app_pages.dart';
import 'package:wakelock/wakelock.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class VideoCallController extends GetxController {
  Signaling? _signaling;
  RxList<dynamic> _peers = [].obs;

  var peer = User().obs;

  var remoteVideoReady = false.obs;
  var localVideoReady = false.obs;

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
  Session? _session;
  String? selfId;

  List get peers => _peers.value;

  set peers(List<dynamic> value) {
    _peers.value = value;
  }

  get localRenderer => _localRenderer;

  get remoteRenderer => _remoteRenderer;

  Signaling? get signaling => _signaling;

  Session? get session => _session;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  init() async {
    _initRenderers();
    _connect();
    selfId = S.Session.instance.user!.username;
  }

  _initRenderers() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();
    remoteVideoReady.value = false;
    localVideoReady.value = false;
  }

  void _connect() async {
    _signaling ??= Signaling(Api.hostClear)..connect();

    _signaling?.onSignalingStateChange = (SignalingState state) {
      switch (state) {
        case SignalingState.ConnectionClosed:
        case SignalingState.ConnectionError:
        case SignalingState.ConnectionOpen:
          break;
      }
    };

    _signaling?.onCallStateChange = (Session session, CallState state) {
      Wakelock.disable();
      callState = state;
      micOff = _signaling!.micState();
      switch (state) {
        case CallState.CallStateNew:
          _session = session;
          Get.to(() => OfferCall());
          break;
        case CallState.CallStateBye:
          localRenderer.srcObject = null;
          remoteRenderer.srcObject = null;
          remoteVideoReady.value = false;
          localVideoReady.value = false;
          _session = null;
          Get.until((route) =>
              route.settings.name == Routes.LANDING ||
              route.settings.name == Routes.CHAT);
          break;
        case CallState.CallStateInvite:
        case CallState.CallStateConnected:
          _session = session;
          Get.to(() => InCall());
          Wakelock.enable();
          break;
        case CallState.CallStateRinging:
          _session = session;
          Get.to(() => RingRing());
          break;
      }
    };

    // _signaling?.onPeersUpdate = ((event) {
    //   selfId = event['self'];
    //   peers = event['peers'];
    // });
    _signaling?.onPeerChange = ((v) {
      peer.value = v;
    });

    _signaling?.onLocalStream = ((stream) {
      localRenderer.srcObject = stream;
      localVideoReady.value = true;
    });

    _signaling?.onAddRemoteStream = ((_, stream) {
      remoteRenderer.srcObject = stream;
      remoteVideoReady.value = true;
    });

    _signaling?.onRemoveRemoteStream = ((_, stream) {
      remoteRenderer.srcObject = null;
      remoteVideoReady.value = false;
    });
  }

  invitePeer(User peer) async {
    this.peer.value = peer;
    if (_signaling != null && (peer.username!) != selfId) {
      _signaling?.invite(peer.username!);
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
    signaling?.close();
    localRenderer.dispose();
    remoteRenderer.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
