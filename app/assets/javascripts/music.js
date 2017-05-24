/**
 * Created by hoang on 22/05/2017.
 */
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
            var audioElement = document.getElementById('player');
            if (audioElement) {
                audioElement.addEventListener('ended', function () {
                    this.play();
                }, false);

                audioElement.addEventListener("canplay", function () {
                    $("#length").text("Duration:" + audioElement.duration + " seconds");
                    $("#source").text("Source:" + audioElement.src);
                    $("#status").text("Status: Ready to play").css("color", "green");
                });

                audioElement.addEventListener("timeupdate", function () {
                    $("#currentTime").text("Current second:" + audioElement.currentTime);
                });

                $('#play').click(function () {
                    audioElement.play();
                    $("#status").text("Status: Playing");
                });

                $('#pause').click(function () {
                    audioElement.pause();
                    $("#status").text("Status: Paused");
                });

                $('#restart').click(function () {
                    audioElement.currentTime = 0;
                });
                $('.playBtn').remove('click');
                $('.playBtn').click(function() {
                    $(audioElement).show();
                    audioElement.setAttribute('src', $(this).attr('name'));
                    audioElement.play();
                });
            }
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
