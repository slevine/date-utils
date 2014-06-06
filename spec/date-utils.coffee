{WorkspaceView} = require 'atom'
DateUtils = require '../lib/date-utils'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "DateUtils", ->
  promise = null
  beforeEach ->
    atom.workspaceView = new WorkspaceView()
    atom.workspace = atom.workspaceView.model
    promise = atom.packages.activatePackage('date-utils')
    waitsForPromise ->
      atom.workspace.open()

  it "inserts", ->
    atom.workspaceView.trigger 'date-utils:insert'
    waitsForPromise ->
      promise
