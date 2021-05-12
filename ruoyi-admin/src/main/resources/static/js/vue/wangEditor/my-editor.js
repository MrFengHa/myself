function initMyEditor(id) {
    const E = window.wangEditor
    const editor = new E(id)
    editor.customConfig.uploadImgServer = '/ow/upload/editorUpload'
    editor.customConfig.uploadImgMaxSize = 10 * 1024 * 1024
    editor.customConfig.uploadImgTimeout = 30000
    editor.customConfig.uploadFileName = 'file'
    editor.customConfig.pasteFilterStyle = false
    editor.create()
    return editor;
}
