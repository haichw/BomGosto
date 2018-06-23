<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Recuperação de conta</title>        
        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/style_login.css">               
    </head>
    <body>
        <div class="form">            
            <div class="tab-content">                    
                <form name="form_login" action="email_sending_servlet.do" method="post">
                    <div class="field-wrap">
                            <label>
                                Insira o Endereço de E-mail<span class="req">*</span>
                            </label>
                            <input type="email" name="email" required autocomplete="off"/>
                        </div>
                    <div class="field-wrap">
                            <label>
                                Insira o telefone registrado a conta<span class="req">*</span>
                            </label>
                            <input type="text" required name="telefone" data-mask="(00) 00000-0000" autocomplete="off"/>
                        </div>
                    <button type="submit" class="button button-block"/>Enviar</button>
                </form>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/login.js"></script>    
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('.date').mask('00/00/0000');
                $('.time').mask('00:00:00');
                $('.date_time').mask('00/00/0000 00:00:00');
                $('.cep').mask('00000-000');
                $('.phone').mask('0000-0000');
                $('.phone_with_ddd').mask('(00) 0000-0000');
                $('.phone_us').mask('(000) 000-0000');
                $('.mixed').mask('AAA 000-S0S');
                $('.ip_address').mask('099.099.099.099');
                $('.percent').mask('##0,00%', {reverse: true});
                $('.clear-if-not-match').mask("00/00/0000", {clearIfNotMatch: true});
                $('.placeholder').mask("00/00/0000", {placeholder: "__/__/____"});
                $('.fallback').mask("00r00r0000", {
                    translation: {
                        'r': {
                            pattern: /[\/]/,
                            fallback: '/'
                        },
                        placeholder: "__/__/____"
                    }
                });

                $('.selectonfocus').mask("00/00/0000", {selectOnFocus: true});

                $('.cep_with_callback').mask('00000-000', {onComplete: function (cep) {
                        console.log('Mask is done!:', cep);
                    },
                    onKeyPress: function (cep, event, currentField, options) {
                        console.log('An key was pressed!:', cep, ' event: ', event, 'currentField: ', currentField.attr('class'), ' options: ', options);
                    },
                    onInvalid: function (val, e, field, invalid, options) {
                        var error = invalid[0];
                        console.log("Digit: ", error.v, " is invalid for the position: ", error.p, ". We expect something like: ", error.e);
                    }
                });

                $('.crazy_cep').mask('00000-000', {onKeyPress: function (cep, e, field, options) {
                        var masks = ['00000-000', '0-00-00-00'];
                        mask = (cep.length > 7) ? masks[1] : masks[0];
                        $('.crazy_cep').mask(mask, options);
                    }});

                $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
                $('.cpf').mask('000.000.000-00', {reverse: true});
                $('.money').mask('#.##0,00', {reverse: true});

                var SPMaskBehavior = function (val) {
                    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
                },
                        spOptions = {
                            onKeyPress: function (val, e, field, options) {
                                field.mask(SPMaskBehavior.apply({}, arguments), options);
                            }
                        };

                $('.sp_celphones').mask(SPMaskBehavior, spOptions);

                $(".bt-mask-it").click(function () {
                    $(".mask-on-div").mask("000.000.000-00");
                    $(".mask-on-div").fadeOut(500).fadeIn(500)
                })

                $('pre').each(function (i, e) {
                    hljs.highlightBlock(e)
                });
            });
        </script>
    </body>
</html>