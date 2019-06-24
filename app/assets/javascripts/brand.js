// $(function() {

//   var user_list = $("#user-search-result");

//   function appendUser(user) {
//     var html = `<div class="chat-group-user clearfix">
//                   <p class="chat-group-user__name">${user.name}</p>
//                   <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
//                 </div>`
//     user_list.append(html);
//   }

//   function appendNewUser(id, name){
//     var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${id} data-id=${id}'>
//                   <input name='group[user_ids][]' type='hidden' value='${id}'>
//                   <p class='chat-group-user__name'>${name}</p>
//                   <div class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</div>
//                 </div>`
//     return html;
//   }

//   $(".form__brand").on("keyup", function() {

//     var input = $(".form__brand").val();

//     $.ajax({
//       type: 'GET',
//       url: 'items/new',
//       data: { keywod: input },
//       dataType: 'json'
//     })

//     .done(function(brands){
//       $(".form__brand").empty();
//       if (users.length !== 0){
//         users.forEach(function(brand){
//           var html = appendUser(brand);
//           $("#user-search-result").append(html);
//         });
//       }
//     })
//   })

//   $("#user-search-result").on("click", ".chat-group-user__btn--add", function(){
//     var id = $(this).attr("data-user-id");
//     var name = $(this).attr("data-user-name");
//     var addNewUser = appendNewUser(id, name);
//     $('#chat-group-users').append(addNewUser);
//     $(this).parent('.chat-group-user').remove();
//   });

//   $("#chat-group-users").on("click", ".user-search-remove", function(){
//     $(this).parent().remove();
//   });
// });

// brandテーブルにインデックスをはる
// brand_idカラムを消す
