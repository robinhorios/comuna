$(document).ready(function(){
	$('.multiple-select').select2();

	$('.zipcode').focusout(function(){
		var zipcode = $(this).val().replace("-", "");
		var url = "http://cep.correiocontrol.com.br/" + zipcode + ".json"
		var address;
		$.ajax({
			url: url,
			success: function(data) {
				address = data;
				
			},

            // beforeSend: function(){
            // 	$('.loader').css({display:"block"});
            // },
            complete: function(){
            	console.log(address.uf);
            	$(".street").val(address.logradouro);
            	$(".city").val(address.localidade);

            	switch(address.uf) {
            		case "AC":
            		$('.select.state option:selected').val($('select.state option:eq(0)').val());
            		$('select.state option:selected').text($('select.state option:eq(0)').text());
            		break;
            		case "AL":
            		$('select.state option:selected').val($('select.state option:eq(1)').val());
            		$('select.state option:selected').text($('select.state option:eq(1)').text());
            		break;
            		case "AM":
            		$('select.state option:selected').val($('select.state option:eq(3)').val());
            		$('select.state option:selected').text($('select.state option:eq(3)').text());
            		break;
            		case "AP":
            		$('select.state option:selected').val($('select.state option:eq(2)').val());
            		$('select.state option:selected').text($('select.state option:eq(2)').text());
            		break;
            		case "BA":
            		$('select.state option:selected').val($('select.state option:eq(4)').val());
            		$('select.state option:selected').text($('select.state option:eq(4)').text());
            		break;
            		case "CE":
            		$('select.state option:selected').val($('select.state option:eq(5)').val());
            		$('select.state option:selected').text($('select.state option:eq(5)').text());
            		break;
            		case "DF":
            		$('select.state option:selected').val($('select.state option:eq(6)').val());
            		$('select.state option:selected').text($('select.state option:eq(6)').text());
            		break;
            		case "ES":
            		$('select.state option:selected').val($('select.state option:eq(7)').val());
            		$('select.state option:selected').text($('select.state option:eq(7)').text());
            		break;
            		case "GO":
            		$('select.state option:selected').val($('select.state option:eq(8)').val());
            		$('select.state option:selected').text($('select.state option:eq(8)').text());
            		break;
            		case "MA":
            		$('select.state option:selected').val($('select.state option:eq(9)').val());
            		$('select.state option:selected').text($('select.state option:eq(9)').text());
            		break;
            		case "MG":
            		$('select.state option:selected').val($('select.state option:eq(12)').val());
            		$('select.state option:selected').text($('select.state option:eq(12)').text());
            		break;
            		case "MS":
            		$('select.state option:selected').val($('select.state option:eq(11)').val());
            		$('select.state option:selected').text($('select.state option:eq(11)').text());
            		break;
            		case "MT":
            		$('select.state option:selected').val($('select.state option:eq(10)').val());
            		$('select.state option:selected').text($('select.state option:eq(10)').text());
            		break;
            		case "PA":
            		$('select.state option:selected').val($('select.state option:eq(13)').val());
            		$('select.state option:selected').text($('select.state option:eq(13)').text());
            		break;
            		case "PB":
            		$('select.state option:selected').val($('select.state option:eq(14)').val());
            		$('select.state option:selected').text($('select.state option:eq(14)').text());
            		break;
            		case "PE":
            		$('select.state option:selected').val($('select.state option:eq(16)').val());
            		$('select.state option:selected').text($('select.state option:eq(16)').text());
            		break;
            		case "PI":
            		$('select.state option:selected').val($('select.state option:eq(17)').val());
            		$('select.state option:selected').text($('select.state option:eq(17)').text());
            		break;
            		case "PR":
            		$('select.state option:selected').val($('select.state option:eq(15)').val());
            		$('select.state option:selected').text($('select.state option:eq(15)').text());
            		break;
            		case "RJ":
            		$('select.state option:selected').val($('select.state option:eq(18)').val());
            		$('select.state option:selected').text($('select.state option:eq(18)').text());
            		break;
            		case "RN":
            		$('select.state option:selected').val($('select.state option:eq(19)').val());
            		$('select.state option:selected').text($('select.state option:eq(19)').text());
            		break;
            		case "RO":
            		$('select.state option:selected').val($('select.state option:eq(21)').val());
            		$('select.state option:selected').text($('select.state option:eq(21)').text());
            		break;
            		case "RR":
            		$('select.state option:selected').val($('select.state option:eq(22)').val());
            		$('select.state option:selected').text($('select.state option:eq(22)').text());
            		break;
            		case "RS":
            		$('select.state option:selected').val($('select.state option:eq(20)').val());
            		$('select.state option:selected').text($('select.state option:eq(20)').text());
            		break;
            		case "SC":
            		$('select.state option:selected').val($('select.state option:eq(23)').val());
            		$('select.state option:selected').text($('select.state option:eq(23)').text());
            		break;
            		case "SE":
            		$('select.state option:selected').val($('select.state option:eq(25)').val());
            		$('select.state option:selected').text($('select.state option:eq(25)').text());
            		break;
            		case "SP":
            		$('select.state option:selected').val($('select.state option:eq(24)').val());
            		$('select.state option:selected').text($('select.state option:eq(24)').text());
            		break;
            		case "TO":
            		$('select.state option:selected').val($('select.state option:eq(26)').val());
            		$('select.state option:selected').text($('select.state option:eq(26)').text());
            		break;
            		
            	}
            }
        });
	});

	$(".phone").mask('(00) 00000-0000');
	$('.zipcode').mask('00000-000');
      $('.schedule').mask('00:00 HR', {placeholder: "00:00"});
});