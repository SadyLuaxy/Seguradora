$("#formValidate").validate({
    rules: {
      text: {
        required: true,
        minlength: 5
      },
      email: {
        required: true,
        email:true
      },
      password: {
        required: true,
        minlength: 5
      },
      cpassword: {
        required: true,
        minlength: 5,
        equalTo: "#password"
      },
      curl: {
        required: true,
        url:true
      },
      crole:"required",
      ccomment: {
        required: true,
        minlength: 15
      },
      cgender:"required",
      cagree:"required",
      },
      //For custom messages
      messages: {
      uname:{
        required: "Digite o nome de usuário",
        minlength: "No mínimo deve ser 5 caracteres"
      },
      curl: "Digite seu website",
      },
      errorElement : 'div',
      errorPlacement: function(error, element) {
        var placement = $(element).data('error');
        if (placement) {
          $(placement).append(error)
        } else {
      error.insertAfter(element);
      }
    }
  });

  $('#date-demo2').formatter({
    'pattern': '{{99}}/{{99}}/{{9999}}',
  });
