/**
 * plugin.js
 *
 * Copyright, Alberto Peripolli
 * Released under Creative Commons Attribution-NonCommercial 3.0 Unported License.
 *
 * Contributing: https://github.com/trippo/ResponsiveFilemanager
 */

tinymce.PluginManager.add('refineryfilemanager', function(editor) {
    
	function openmanager() {
		editor.focus(true);
		var title="Refinery FileManager";
		if (typeof editor.settings.filemanager_title !== "undefined" && editor.settings.filemanager_title) {
			title=editor.settings.filemanager_title;
		}
		var akey="key";
		if (typeof editor.settings.filemanager_access_key !== "undefined" && editor.settings.filemanager_access_key) {
			akey=editor.settings.filemanager_access_key;
		}
		var sort_by="";
		if (typeof editor.settings.filemanager_sort_by !== "undefined" && editor.settings.filemanager_sort_by) {
			sort_by="&sort_by="+editor.settings.filemanager_sort_by;
		}
		var descending="false";
		if (typeof editor.settings.filemanager_descending !== "undefined" && editor.settings.filemanager_descending) {
			descending=editor.settings.filemanager_descending;
		}
		var fldr="";
		if (typeof editor.settings.filemanager_subfolder !== "undefined" && editor.settings.filemanager_subfolder) {
			fldr="&fldr="+editor.settings.filemanager_subfolder;
		}
		// Disabled because of bug
		var type=2;
		if (typeof editor.settings.filemanager_type !== "undefined" && editor.settings.filemanager_type) {
			if ($.isNumeric(editor.settings.filemanager_type) === true && editor.settings.filemanager_type > 0 && editor.settings.filemanager_type <= 3) {
				type=editor.settings.filemanager_type;
			}
			else if (editor.settings.filemanager_type == 'image'){
				type = 1;
			}
			else if (editor.settings.filemanager_type == 'media'){
				type = 3;
			}
			else {
				type = 2;
			}
		}

		win = editor.windowManager.open({
			title: title,
			file: editor.settings.external_filemanager_path+'images/insert?modal=true',
			width: 860,
			height: 300,
			inline: 1,
			resizable: true,
			maximizable: true
		});
	}
    
	editor.addButton('refineryfilemanager', {
		icon: 'browse',
		tooltip: 'Insert Image',
		shortcut: 'Ctrl+E',
                onclick:openmanager
	});
        
	editor.addShortcut('Ctrl+E', '', openmanager);

	editor.addMenuItem('refineryfilemanager', {
		icon: 'browse',
		text: 'Insert Image',
		shortcut: 'Ctrl+E',
		onclick: openmanager,
		context: 'insert'
	});
	
});