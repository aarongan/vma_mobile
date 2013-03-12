
define("icsMobile/config", ["dojo/dom-construct"], function(domConstruct){  
            return {
				loadingIcon: domConstruct.create('div', {
					id: 'ICSCurtain',
					innerHTML: '<img src="../styles/images/ics/common/processing_big.gif"/><div class="label">LOADING...</div>'
				}),
                itemsPerPage: 30, //Maximum items shown per page for message list
                ids: {// the ids for main containers
                    MAIN_ID: 'icsMobile-main',
					CONTAINER_ID: 'icsMobile-mainContainer',
					DISPLAY_ID: 'icsMobile-displayContainer',
					LOADING_ID: 'icsMobile-loadingContainer'
                },
                isStatic: true,
				
				defaultProfileImage: require.toUrl('styles/images/ics/inbox/blankProfile.png'),
				defaultVideoImage: require.toUrl('styles/images/ics/vmm/defaultVideo.png'),			
				defaultMusicImage: require.toUrl('styles/images/ics/vmm/defaultMusic.png'),
				defaultDocumentImage: require.toUrl('styles/images/ics/vmm/defaultDocument.png'),
				defaultPictureImage: require.toUrl('styles/images/ics/vmm/defaultPicture.png'),
        		warningImage: require.toUrl('styles/images/ics/vmm/noaction.png'),
				downloadUrlTemplate: '../inbox/attachment/downloadAttachmentAction.action?request.sourceMessageId=${sourceMessgaeUID}&request.messageId=${messageId}' +
							          '&request.type=${msgType}&request.folder=${folder}&request.attachmentPartPath=${attachPath}&request.composerId=${composerId}'
            }
});				


