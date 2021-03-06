`import React from 'react'`
{div, input, button, form, i, text} = React.DOM

Home = React.createClass
  handleSubmit: (e) ->
    e.preventDefault()
    if inputValue = @refs.homeInput.getDOMNode().value
      location.assign "/#/playlists/#{inputValue}"
  render: ->
    div className: 'home flex-horizontal',
      div className: 'flex-item-fluid'
      div className: 'flex-item-fixed container',
        div className: 'home__title', 'Karaoke Playlist'
        form className: 'flex-horizontal flex-center-align-items', onSubmit: @handleSubmit,
          div className: 'flex-item-fluid'
          div className: 'flex-item-fluid',
            input ref: 'homeInput', type: 'text', className: 'home__input', placeholder: 'playlist name'
          div className: 'flex-item-fixed',
            button type: 'submit', className: 'button home__go-to-playlist-button',
              i className: 'fa fa-play'
              text {}, 'Go To Playlist'
          div className: 'flex-item-fluid'
      div className: 'flex-item-fluid'

`export default Home`