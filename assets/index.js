// For an introduction to the Blank template, see the following documentation:
// http://go.microsoft.com/fwlink/?LinkID=397704
// To debug code on page load in cordova-simulate or on Android devices/emulators: launch your app, set breakpoints, 
// and then run "window.location.reload()" in the JavaScript Console.

(function () {
    "use strict";

    document.addEventListener( 'deviceready', onDeviceReady.bind( this ), false );

    function onDeviceReady() {
        // Handle the Cordova pause and resume events
        document.addEventListener( 'pause', onPause.bind( this ), false );
        document.addEventListener('resume', onResume.bind(this), false);
        document.addEventListener("backbutton", deviceBackBtnEvntHandlr.bind(this), false);
        // TODO: Cordova has been loaded. Perform any initialization that requires Cordova here.
        
        FCMPlugin.onTokenRefresh(function (token) {
            var uuid = device.uuid;
            var reqUrl = 'http://hazratkhurramabbasi.org/Webservice/addUpdateDeviceToken/' + uuid + '/' + token;

            $.get(reqUrl, function (data) {});

        });

        FCMPlugin.getToken(function (token) {
            var uuid = device.uuid;
             var reqUrl = 'http://hazratkhurramabbasi.org/Webservice/addUpdateDeviceToken/' + uuid + '/' + token;
             $.get(reqUrl, function (data) {});

        });

        FCMPlugin.onNotification(function (data) {
            if (data.wasTapped) {
                //Notification was received on device tray and tapped by the user.
            } else {
                //Notification was received in foreground. Maybe the user needs to be notified.
            }
        });

        function checkConnection() {
            //return true;
            var networkState = navigator.connection.type;
            var ret = false;

            var states = {};
            if (networkState) {
                states[Connection.NONE] = 'No network connection';
            }
            if (networkState == "none") {
                $(".player2").hide();
                $(".status_para").text(states[Connection.NONE]);
                ret = false;
            }
            else {
                $(".player2").show();
                $(".status_para").text("Status: Off Air");
                ret = true;
            }
            return ret;
        }

        var livePlayerMedia = null;
        function initPlayer() {
            $(".mediaElement").html('<audio class="player2" controls style="max-width:80%; width: 80%;display:none"><source src="" type="audio/mp3"></audio>');

            if ((livePlayerMedia) && (!livePlayerMedia.paused)) {
                livePlayerMedia.pause();
            }

            if (livePlayerMedia) {
                livePlayerMedia.remove();
            }

            var livePlayer = $(".player2");
            livePlayerMedia = new MediaElementPlayer(livePlayer[0], {
                success: function (media) { }
            });

            $(".status_para").text('Status: Connecting..');
            $.get("https://api.mixlr.com/users/6276123?source=embed", function (data) {
                if (data.is_live) {
                    var broadcast = data.current_broadcast;
                    var broadcastStream = broadcast.streams["progressive"];
                    var broadcastmime_type = broadcastStream.mime_type;
                    var broadcastUrl = broadcastStream.url;
                    livePlayerMedia.setSrc(broadcastUrl);
                    livePlayerMedia.load();
                    livePlayerMedia.play();
                    livePlayerMedia.setVolume(0.8);
                    $(".status_para").text('Status: On Air');
                }
                else {
                    {
                        $.ajax({
                            url: 'http://99.198.118.250:8333/?type=http',
                            timeout: 2000
                        }).fail(function (jqXHR, textStatus) {
                            if (textStatus === 'timeout') {
                                livePlayerMedia.setSrc("http://99.198.118.250:8333/?type=http");
                                livePlayerMedia.load();
                                livePlayerMedia.play();
                                livePlayerMedia.setVolume(0.8);
                                $(".status_para").text('Status: On Air');
                            }
                            if (textStatus === 'error') {
                                $(".status_para").text('Status: Off Air');
                                livePlayerMedia.setSrc("");
                                livePlayerMedia.play();
                                livePlayerMedia.setVolume(0.8);
                            }
                        });
                    }
                }
            });
        }

        //Check internet connection
        if (checkConnection()) {
            initPlayer();
        }

        $(".reconnect").click(function () {
            if (checkConnection())
            {
                $('.reconnect').prop('disabled', true);
                initPlayer();
                $('.reconnect').prop('disabled', false);
            }
        });
        

    };

    function onPause() {
        // TODO: This application has been suspended. Save application state here.
    };

    function onResume() {
        // TODO: This application has been reactivated. Restore application state here.
    };

    function deviceBackBtnEvntHandlr() {
        if ($(".sidebar_nav").hasClass("sidebar_open")) {
            $(".sidebar_nav").removeClass("sidebar_open")
        }
        else {
            $('#exitApplication').modal('show'); 
        }
    };
})();
