{pkgs, ...}: {
  home.packages = with pkgs; [vesktop];
  xdg.configFile."vesktop/settings/settings.json".text = ''
    {
        "autoUpdate": true,
        "autoUpdateNotification": true,
        "useQuickCss": false,
        "themeLinks": [],
        "enabledThemes": [
            "stylix.theme.css"
        ],
        "enableReactDevtools": false,
        "frameless": false,
        "transparent": false,
        "winCtrlQ": false,
        "disableMinSize": false,
        "winNativeTitleBar": false,
        "plugins": {
            "ChatInputButtonAPI": {
                "enabled": false
            },
            "CommandsAPI": {
                "enabled": true
            },
            "MemberListDecoratorsAPI": {
                "enabled": false
            },
            "MessageAccessoriesAPI": {
                "enabled": true
            },
            "MessageDecorationsAPI": {
                "enabled": false
            },
            "MessageEventsAPI": {
                "enabled": false
            },
            "MessagePopoverAPI": {
                "enabled": false
            },
            "MessageUpdaterAPI": {
                "enabled": false
            },
            "ServerListAPI": {
                "enabled": false
            },
            "UserSettingsAPI": {
                "enabled": true
            },
            "AlwaysAnimate": {
                "enabled": false
            },
            "AlwaysTrust": {
                "enabled": false
            },
            "AnonymiseFileNames": {
                "enabled": false
            },
            "AppleMusicRichPresence": {
                "enabled": false
            },
            "WebRichPresence (arRPC)": {
                "enabled": false
            },
            "BANger": {
                "enabled": false
            },
            "BetterFolders": {
                "enabled": false
            },
            "BetterGifAltText": {
                "enabled": false
            },
            "BetterGifPicker": {
                "enabled": false
            },
            "BetterNotesBox": {
                "enabled": false
            },
            "BetterRoleContext": {
                "enabled": false
            },
            "BetterRoleDot": {
                "enabled": false
            },
            "BetterSessions": {
                "enabled": false
            },
            "BetterSettings": {
                "enabled": false
            },
            "BetterUploadButton": {
                "enabled": false
            },
            "BiggerStreamPreview": {
                "enabled": false
            },
            "BlurNSFW": {
                "enabled": false
            },
            "CallTimer": {
                "enabled": false
            },
            "ClearURLs": {
                "enabled": false
            },
            "ClientTheme": {
                "enabled": true
            },
            "ColorSighted": {
                "enabled": false
            },
            "ConsoleJanitor": {
                "enabled": false
            },
            "ConsoleShortcuts": {
                "enabled": false
            },
            "CopyEmojiMarkdown": {
                "enabled": false
            },
            "CopyUserURLs": {
                "enabled": false
            },
            "CrashHandler": {
                "enabled": true
            },
            "CtrlEnterSend": {
                "enabled": false
            },
            "CustomRPC": {
                "enabled": false
            },
            "CustomIdle": {
                "enabled": false
            },
            "Dearrow": {
                "enabled": false
            },
            "Decor": {
                "enabled": false
            },
            "DisableCallIdle": {
                "enabled": false
            },
            "DontRoundMyTimestamps": {
                "enabled": false
            },
            "EmoteCloner": {
                "enabled": false
            },
            "Experiments": {
                "enabled": false
            },
            "F8Break": {
                "enabled": false
            },
            "FakeNitro": {
                "enabled": true,
                "enableEmojiBypass": true,
                "enableStickerBypass": true,
                "enableStreamQualityBypass": true,
                "transformStickers": true,
                "transformEmojis": true,
                "transformCompoundSentence": false
            },
            "FakeProfileThemes": {
                "enabled": true,
                "nitroFirst": true
            },
            "FavoriteEmojiFirst": {
                "enabled": false
            },
            "FavoriteGifSearch": {
                "enabled": false
            },
            "FixCodeblockGap": {
                "enabled": false
            },
            "FixSpotifyEmbeds": {
                "enabled": false
            },
            "FixYoutubeEmbeds": {
                "enabled": false
            },
            "ForceOwnerCrown": {
                "enabled": false
            },
            "FriendInvites": {
                "enabled": false
            },
            "FriendsSince": {
                "enabled": false
            },
            "GameActivityToggle": {
                "enabled": false
            },
            "GifPaste": {
                "enabled": false
            },
            "GreetStickerPicker": {
                "enabled": false
            },
            "HideAttachments": {
                "enabled": false
            },
            "iLoveSpam": {
                "enabled": false
            },
            "IgnoreActivities": {
                "enabled": false
            },
            "ImageLink": {
                "enabled": false
            },
            "ImageZoom": {
                "enabled": false
            },
            "ImplicitRelationships": {
                "enabled": false
            },
            "InvisibleChat": {
                "enabled": false
            },
            "KeepCurrentChannel": {
                "enabled": false
            },
            "LastFMRichPresence": {
                "enabled": false
            },
            "LoadingQuotes": {
                "enabled": false
            },
            "MemberCount": {
                "enabled": false
            },
            "MentionAvatars": {
                "enabled": false
            },
            "MessageClickActions": {
                "enabled": false
            },
            "MessageLatency": {
                "enabled": false
            },
            "MessageLinkEmbeds": {
                "enabled": false
            },
            "MessageLogger": {
                "enabled": false
            },
            "MessageTags": {
                "enabled": false
            },
            "MoreCommands": {
                "enabled": false
            },
            "MoreKaomoji": {
                "enabled": false
            },
            "MoreUserTags": {
                "enabled": false
            },
            "Moyai": {
                "enabled": false
            },
            "MutualGroupDMs": {
                "enabled": false
            },
            "NewGuildSettings": {
                "enabled": false
            },
            "NoBlockedMessages": {
                "enabled": false
            },
            "NoDefaultHangStatus": {
                "enabled": false
            },
            "NoDevtoolsWarning": {
                "enabled": false
            },
            "NoF1": {
                "enabled": false
            },
            "NoMaskedUrlPaste": {
                "enabled": false
            },
            "NoMosaic": {
                "enabled": false
            },
            "NoOnboardingDelay": {
                "enabled": false
            },
            "NoPendingCount": {
                "enabled": false
            },
            "NoProfileThemes": {
                "enabled": false
            },
            "NoReplyMention": {
                "enabled": false
            },
            "NoScreensharePreview": {
                "enabled": false
            },
            "NoServerEmojis": {
                "enabled": false
            },
            "NoTypingAnimation": {
                "enabled": false
            },
            "NoUnblockToJump": {
                "enabled": false
            },
            "NormalizeMessageLinks": {
                "enabled": false
            },
            "NotificationVolume": {
                "enabled": false
            },
            "NSFWGateBypass": {
                "enabled": false
            },
            "OnePingPerDM": {
                "enabled": false
            },
            "oneko": {
                "enabled": false
            },
            "OpenInApp": {
                "enabled": false
            },
            "OverrideForumDefaults": {
                "enabled": false
            },
            "PartyMode": {
                "enabled": false
            },
            "PauseInvitesForever": {
                "enabled": false
            },
            "PermissionFreeWill": {
                "enabled": false
            },
            "PermissionsViewer": {
                "enabled": false
            },
            "petpet": {
                "enabled": false
            },
            "PictureInPicture": {
                "enabled": false
            },
            "PinDMs": {
                "enabled": false
            },
            "PlainFolderIcon": {
                "enabled": false
            },
            "PlatformIndicators": {
                "enabled": false
            },
            "PreviewMessage": {
                "enabled": false
            },
            "PronounDB": {
                "enabled": false
            },
            "QuickMention": {
                "enabled": false
            },
            "QuickReply": {
                "enabled": false
            },
            "ReactErrorDecoder": {
                "enabled": false
            },
            "ReadAllNotificationsButton": {
                "enabled": false
            },
            "RelationshipNotifier": {
                "enabled": false
            },
            "ReplaceGoogleSearch": {
                "enabled": false
            },
            "ReplyTimestamp": {
                "enabled": false
            },
            "RevealAllSpoilers": {
                "enabled": false
            },
            "ReverseImageSearch": {
                "enabled": false
            },
            "ReviewDB": {
                "enabled": false
            },
            "RoleColorEverywhere": {
                "enabled": false
            },
            "SecretRingToneEnabler": {
                "enabled": false
            },
            "Summaries": {
                "enabled": false
            },
            "SendTimestamps": {
                "enabled": false
            },
            "ServerInfo": {
                "enabled": false
            },
            "ServerListIndicators": {
                "enabled": false
            },
            "ShikiCodeblocks": {
                "enabled": false
            },
            "ShowAllMessageButtons": {
                "enabled": false
            },
            "ShowConnections": {
                "enabled": false
            },
            "ShowHiddenChannels": {
                "enabled": false
            },
            "ShowHiddenThings": {
                "enabled": false
            },
            "ShowMeYourName": {
                "enabled": false
            },
            "ShowTimeoutDuration": {
                "enabled": false
            },
            "SilentMessageToggle": {
                "enabled": false
            },
            "SilentTyping": {
                "enabled": false
            },
            "SortFriendRequests": {
                "enabled": false
            },
            "SpotifyControls": {
                "enabled": false
            },
            "SpotifyCrack": {
                "enabled": false
            },
            "SpotifyShareCommands": {
                "enabled": false
            },
            "StartupTimings": {
                "enabled": false
            },
            "StreamerModeOnStream": {
                "enabled": false
            },
            "SuperReactionTweaks": {
                "enabled": false
            },
            "TextReplace": {
                "enabled": false
            },
            "ThemeAttributes": {
                "enabled": false
            },
            "TimeBarAllActivities": {
                "enabled": false
            },
            "Translate": {
                "enabled": false
            },
            "TypingIndicator": {
                "enabled": false
            },
            "TypingTweaks": {
                "enabled": false
            },
            "Unindent": {
                "enabled": false
            },
            "UnlockedAvatarZoom": {
                "enabled": false
            },
            "UnsuppressEmbeds": {
                "enabled": false
            },
            "UserVoiceShow": {
                "enabled": false
            },
            "USRBG": {
                "enabled": false
            },
            "ValidReply": {
                "enabled": false
            },
            "ValidUser": {
                "enabled": false
            },
            "VoiceChatDoubleClick": {
                "enabled": false
            },
            "VcNarrator": {
                "enabled": false
            },
            "VencordToolbox": {
                "enabled": false
            },
            "ViewIcons": {
                "enabled": false
            },
            "ViewRaw": {
                "enabled": false
            },
            "VoiceDownload": {
                "enabled": false
            },
            "VoiceMessages": {
                "enabled": false
            },
            "WebKeybinds": {
                "enabled": true
            },
            "WebScreenShareFixes": {
                "enabled": true
            },
            "WhoReacted": {
                "enabled": false
            },
            "XSOverlay": {
                "enabled": false
            },
            "YoutubeAdblock": {
                "enabled": false
            },
            "NoTrack": {
                "enabled": true,
                "disableAnalytics": true
            },
            "WebContextMenus": {
                "enabled": true,
                "addBack": true
            },
            "Settings": {
                "enabled": true,
                "settingsLocation": "aboveNitro"
            },
            "FullSearchContext": {
                "enabled": false
            }
        },
        "notifications": {
            "timeout": 5000,
            "position": "bottom-right",
            "useNative": "not-focused",
            "logLimit": 50
        },
        "cloud": {
            "authenticated": false,
            "url": "https://api.vencord.dev/",
            "settingsSync": false,
            "settingsSyncVersion": 1726836836902
        }
    },
  '';
}
