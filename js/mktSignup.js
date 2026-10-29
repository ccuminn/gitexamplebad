jQuery(document).ready(function(){
	/* jQuery.validator.addMethod("password", function( value, element ) {
		var result = this.optional(element) || value.length >= 6 && /\d/.test(value) && /[a-z]/i.test(value);
		if (!result) {
			element.value = "";
			var validator = this;
			setTimeout(function() {
				validator.blockFocusCleanup = true;
				element.focus();
				validator.blockFocusCleanup = false;
			}, 1);
		}
		return result;
	}, "Vaše heslo musí být alespoň 6 znaků dlouhé a musí obsahovat alespoň jeden znak a jednu číslici."); */

	// a custom method making the default value for companyurl ("http://") invalid, without displaying the "invalid url" message
	jQuery.validator.addMethod("defaultInvalid", function(value, element) {
		return value != element.defaultValue;
	}, "");

	jQuery.validator.addMethod("billingRequired", function(value, element) {
		if (jQuery("#bill_to_co").is(":checked"))
			return jQuery(element).parents(".subTable").length;
		return !this.optional(element);
	}, "");

	jQuery.validator.messages.required = "";
	jQuery('.form-validate').each( function(){
    jQuery(this).validate({
		invalidHandler: function(e, validator) {
			var errors = validator.numberOfInvalids();
			if (errors) {
				var message = '<p class="msg-error">Zvýrazněná pole formuláře je nutné vyplnit.</p>';
				jQuery("span.messages", this).html(message);
				jQuery("span.messages", this).show();
			} else {
				jQuery("span.messages", this).hide();
			}
		},
		onkeyup: false,
		submitHandler: function(form) {
			//jQuery("div.error").hide();
			form.submit();
		},
		messages: {
		  pass: {
        minlength: "Heslo musí být alespoň 6 znaků dlouhé"
      },
			pass2: {
				required: " ",
				equalTo: "Vložte stejné heslo pro potvrzení"
			},
			email: {
				required: " ",
				email: "Vložte prosím validní e-mailovou adresu.",
				remote: jQuery.validator.format("{0} is already taken, please enter a different address.")
			}
		},
		debug:true
	})
  });

  jQuery(".resize").vjustify();
  jQuery("div.buttonSubmit").hoverClass("buttonSubmitHover");

  jQuery("input.ico").mask2("99999999");
  jQuery("input.dic").mask2("CZ99999999");
  jQuery("input.phone").mask2("+999 999 999 999");
  jQuery("input.zipcode").mask2("999 99");
  var creditcard = jQuery("#creditcard").mask2("9999 9999 9999 9999");

  jQuery("#cc_type").change(
    function() {
      switch (jQuery(this).val()){
        case 'amex':
          creditcard.unmask().mask2("9999 999999 99999");
          break;
        default:
          creditcard.unmask().mask2("9999 9999 9999 9999");
          break;
      }
    }
  );

  // toggle optional billing address
  var subTableDiv = jQuery("div.subTableDiv");
  var toggleCheck = jQuery("input.toggleCheck");
  toggleCheck.is(":checked")
  	? subTableDiv.hide()
	: subTableDiv.show();
  jQuery("input.toggleCheck").click(function() {
      if (this.checked == true) {
        subTableDiv.slideUp("medium");
        jQuery("form").valid();
      } else {
        subTableDiv.slideDown("medium");
      }
  });


});

jQuery.fn.vjustify = function() {
    var maxHeight=0;
    jQuery(".resize").css("height","auto");
    this.each(function(){
        if (this.offsetHeight > maxHeight) {
          maxHeight = this.offsetHeight;
        }
    });
    this.each(function(){
        jQuery(this).height(maxHeight);
        if (this.offsetHeight > maxHeight) {
            jQuery(this).height((maxHeight-(this.offsetHeight-maxHeight)));
        }
    });
};

jQuery.fn.hoverClass = function(classname) {
	return this.hover(function() {
		jQuery(this).addClass(classname);
	}, function() {
		jQuery(this).removeClass(classname);
	});
};