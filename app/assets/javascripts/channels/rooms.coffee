jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "UmbrellasChannel"
        umbrella_id: messages.data('umbrella-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, umbrella_id) ->
        @perform 'send_message', message: message, umbrella_id: umbrella_id

      $('#new_message').submit (e) ->
        $this = $(this)
        textarea = $this.find('#message_body')
        if $.trim(textarea.val()).length > 0
          App.global_chat.send_message textarea.val(), messages.data('umbrella-id')
          textarea.val('')
        e.preventDefault()
        return false