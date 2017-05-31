/**
 * Created by hoang on 22/05/2017.
 */
var music_player;
var current_song = null;
var currentTime = null;
(function($) {
    var musicSharingNetwork;
    musicSharingNetwork = {
        init: function() {
            var bootUp, pageRestore, pageUpdate, self;
            self = this;
            bootUp = function() {
                self.siteBootUp();
            };
            pageUpdate = function() {
                self.sitePageUpdate();
            };
            pageRestore = function() {
                return self.sitePageRestore();
            };
            $(document).on("turbolinks:load", bootUp);
            $(document).on("turbolinks:update", pageUpdate);
            $(document).on("turbolinks:restore", pageRestore);
        },
        siteBootUp: function() {
            var self;
            self = this;
            self.initSemanticUiTools();
            self.initAvatarPreview();
            self.initUploadAvatar();
            self.initLoadingForm();
            self.initPlayer();
        },
        sitePageUpdate: function() {
            var self;
            self = this;
            self.initCloseMessage();
        },
        sitePageRestore: function() {
            var self;
            self = this;
            self.initRemoveLoading();
        },
        initSemanticUiTools: function() {
            $(".run-popup").popup();
            $(".ui.selection.dropdown").dropdown();
            $('.ui.sticky').sticky({
                offset: 100,
                bottomOffset: 50,
                context: '#main'
            });
            $('.modal-toggle').click(function() {
                return $('.song-form').modal('show');
            });
            $('.ui.radio.checkbox').checkbox();
            $('.secondary.menu').find('.item').click(function() {
                $('.item.active').removeClass('active');
                $(this).addClass('active');
                return $('.status-panel').html('<div class="ui center aligned basic segment"><i class="spinner loading icon"></i>' + $('.secondary').data('loading') + '</div>');
            });
        },
        initAvatarPreview: function() {
            $(document).ready(function() {
                var AvatarPreview;
                AvatarPreview = function(avatar) {
                    var reader;
                    if (avatar.files && avatar.files[0]) {
                        reader = new FileReader();
                        reader.onload = function(e) {
                            $(".user-avatar").attr("src", e.target.result);
                        };
                        reader.readAsDataURL(avatar.files[0]);
                    }
                };
                $(".upload-avatar").change(function() {
                    AvatarPreview(this);
                });
            });
        },
        initUploadAvatar: function() {
            $("input#user_avatar").css("display", "none");
            $(".user-avatar-upload").click(function() {
                $(".upload-avatar").click();
            });
        },
        initCloseMessage: function() {
            $(".message .close").on("click", function() {
                $(this).closest(".message").fadeOut();
            });
        },
        initPlayer: function() {
            if (!current_song) {
                var firstSongElement = $(document.getElementsByClassName('play-music')[0]);
                current_song = {
                    title: firstSongElement.attr('data-title'),
                    mp3: firstSongElement.attr('data-file')
                };
            }
            music_player = $("#jquery_jplayer_1").jPlayer({
                ready: function (event) {
                    $(this).jPlayer("setMedia", current_song);
                    if (currentTime == null) {
                        $(this).jPlayer("play", 1);
                    } else {
                        $(this).jPlayer("play", currentTime);
                    }

                },
                pause: function() {
                    $(this).jPlayer("pause");
                },
                supplied: "mp3",
                preload: "none",
                volume: 1,
                wmode: "window",
                useStateClassSkin: true,
                autoBlur: false,
                keyEnabled: true
            });
            setTimeout(function(){
                music_player.bind($.jPlayer.event.timeupdate, function(event) {
                    currentTime = Math.floor(event.jPlayer.status.currentTime);
                });
            }, 2000);

            $('.play-music').remove('click');
            $('.play-music').click(function() {
                music_player.jPlayer("setMedia", {
                    title: $(this).attr('data-title'),
                    mp3: $(this).attr('data-file')
                });
                music_player.jPlayer("play", 1);
            });
        },
        initLoadingForm: function() {
            return $('input[name=commit]').click(function() {
                $('.ui.form').addClass("loading");
                return $('.ui.form .button').addClass("disabled");
            });
        },
        initRemoveLoading: function() {
            return $('.ui.form').removeClass("loading");
        }
    };
    window.musicSharingNetwork = musicSharingNetwork;
})(jQuery);

$(document).ready(function() {
    musicSharingNetwork.init();
    musicSharingNetwork.siteBootUp();
});
