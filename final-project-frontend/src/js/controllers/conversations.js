angular
.module('finalProject')
.controller('ConversationsIndexCtrl', ConversationsIndexCtrl)
.controller('ConversationsShowCtrl', ConversationsShowCtrl);



ConversationsIndexCtrl.$inject = ['Conversation', 'Message'];
function ConversationsIndexCtrl(Conversation) {
  const vm = this;
  vm.message = {};
  Conversation
  .query()
  .$promise
  .then((conversations) => {
    vm.all = conversations;
    vm.message.conversation_id = vm.all[0].id;
  });
  function deleteConversation(conversation) {
    console.log('asdsada');
    Conversation
    .delete({ id: conversation.id })
    .$promise
    .then(() => {
      const index = vm.all.indexOf(conversation);
      vm.all.splice(index, 1);
    });
  }

  vm.deleteConversation = deleteConversation;


}



ConversationsShowCtrl.$inject = ['Conversation', 'Message', '$state'];
function ConversationsShowCtrl(Conversation, Message, $state) {
  const vm = this;
  vm.message = {};
  vm.conversation = Conversation.get($state.params);

  Conversation
  .query()
  .$promise
  .then((conversations) => {
    vm.all = conversations;
    vm.message.conversation_id = vm.all[0].id;
  });




  function sendMessage() {

    Message
    .save($state.params, vm.message)
    .$promise
    .then((message) => {
      vm.conversation.messages.push(message);
      vm.message = {};
    });

  }
  vm.sendMessage = sendMessage;
}
