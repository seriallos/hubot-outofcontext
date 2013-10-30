chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'outofcontext', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
      brain:
        data: {}
        on: ->
        emit: ->

    require('../src/outofcontext')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/ooc Test Name: Wibble/)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/Blah blah blah/)
