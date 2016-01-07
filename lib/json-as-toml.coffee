JsonAsTomlView = require './json-as-toml-view'
{CompositeDisposable} = require 'atom'

module.exports = JsonAsToml =
  jsonAsTomlView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @jsonAsTomlView = new JsonAsTomlView(state.jsonAsTomlViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @jsonAsTomlView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'json-as-toml:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @jsonAsTomlView.destroy()

  serialize: ->
    jsonAsTomlViewState: @jsonAsTomlView.serialize()

  toggle: ->
    console.log 'JsonAsToml was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
