<?php if(!class_exists('Rain\Tpl')){exit;}?>
    <title> Parcelas e Comissões | Agência de Seguros Admin</title>
    <link rel="apple-touch-icon" href="/res/admin/assets/images/favicon/apple-touch-icon-152x152.png">
    <link rel="shortcut icon" type="image/x-icon" href="/res/admin/assets/images/favicon/favicon-32x32.png">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- BEGIN: VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/vendors/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/vendors/flag-icon/css/flag-icon.min.css">
    <!-- END: VENDOR CSS-->

    <!-- BEGIN: Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/css/themes/vertical-modern-menu-template/materialize.css">
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/css/themes/vertical-modern-menu-template/style.css">
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/css/pages/app-sidebar.css">
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/css/pages/app-contacts.css">
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/css/themes/vertical-modern-menu-template/style.css">
    <!-- END: Page Level CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/css/custom/custom.css">
    <!-- END: Custom CSS-->

    <link rel="stylesheet" type="text/css" href="/res/admin/assets/vendors/data-tables/css/jquery.dataTables.min.css">
    <!-- END: VENDOR CSS-->
    <!-- BEGIN: Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="/res/admin/assets/css/pages/data-tables.css">

    <style>
       
.breadcrumb:before {
    font-size: 16px !important;
}
    </style>
  </head>
  <body class="vertical-layout vertical-menu-collapsible page-header-dark vertical-modern-menu 2-columns  " data-open="click" data-menu="vertical-modern-menu" data-col="2-columns">

    <!-- Início: Header-->
    <header class="page-topbar" id="header">
      <div class="navbar navbar-fixed"> 
        <nav class="navbar-main navbar-color nav-collapsible sideNav-lock navbar-dark red no-shadow">
          <div class="nav-wrapper">
            <div class="header-search-wrapper hide-on-med-and-down">
              <i class="material-icons">search</i>
              <input class="header-search-input z-depth-2" type="text" required name="Search" placeholder="Pesquisar">
            </div>
            <ul class="navbar-list right">
              <!-- Tradutor 
                <li class="hide-on-med-and-down">
                  <a class="waves-effect waves-block waves-light translation-button" href="javascript:void(0);" data-target="translation-dropdown">
                    <span class="flag-icon flag-icon-gb"></span>
                  </a>
                </li>
              -->
              <li class="hide-on-med-and-down">
                <a class="waves-effect waves-block waves-light toggle-fullscreen" href="javascript:void(0);">
                  <i class="material-icons">settings_overscan</i>
                </a>
              </li>
              <li class="hide-on-large-only">
                <a class="waves-effect waves-block waves-light search-button" href="javascript:void(0);">
                  <i class="material-icons">search</i>
                </a>
              </li>
              <li>
                <a class="waves-effect waves-block waves-light notification-button" href="javascript:void(0);" data-target="notifications-dropdown">
                  <i class="material-icons">notifications_none<small class="notification-badge">5</small>
                  </i>
                </a>
              </li>
              <li>
                <a class="waves-effect waves-block waves-light profile-button" href="javascript:void(0);" data-target="profile-dropdown">
                  <span class="avatar-status avatar-online">
                    <img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar"><i></i>
                  </span>
                </a>
              </li>
              <li><a class="waves-effect waves-block waves-light sidenav-trigger" href="#" data-target="slide-out-right"><i class="material-icons">format_indent_increase</i></a></li>
            </ul>
            <!-- Início botão de tradução
            <ul class="dropdown-content" id="translation-dropdown">
              <li><a class="grey-text text-darken-1" href="#!"><i class="flag-icon flag-icon-gb"></i> English</a></li>
              <li><a class="grey-text text-darken-1" href="#!"><i class="flag-icon flag-icon-fr"></i> French</a></li>
              <li><a class="grey-text text-darken-1" href="#!"><i class="flag-icon flag-icon-cn"></i> Chinese</a></li>
              <li><a class="grey-text text-darken-1" href="#!"><i class="flag-icon flag-icon-de"></i> German</a></li>
            </ul>
            Fim botão de tradução-->
            <!-- Início do dropdown de notificações-->
            <ul class="dropdown-content" id="notifications-dropdown">
              <li>
                <h6>Notificações<span class="new badge" data-badge-caption="Ver todas"></span></h6>
              </li>
              <li class="divider"></li>
              <li><a class="grey-text text-darken-2" href="#!"><span class="material-icons icon-bg-circle cyan small">add_shopping_cart</span> Novas compras feitas!</a>
                <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">2 horas atrás</time>
              </li>
              <li><a class="grey-text text-darken-2" href="#!"><span class="material-icons icon-bg-circle red small">stars</span> Lista finalizada</a>
                <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">3 dias atrás</time>
              </li>
              <li><a class="grey-text text-darken-2" href="#!"><span class="material-icons icon-bg-circle teal small">settings</span> Definições alteradas</a>
                <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">4 dias atrás</time>
              </li>
              <li><a class="grey-text text-darken-2" href="#!"><span class="material-icons icon-bg-circle deep-orange small">today</span> Director agendou uma reunião</a>
                <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">6 dias atrás</time>
              </li>
            </ul>
            <!-- Fim do dropdown de notificações-->
            <!-- Início Perfil do dropdown-->
            <ul class="dropdown-content" id="profile-dropdown">
              <li><a class="grey-text text-darken-1" href="user-profile-page.html"><i class="material-icons">person_outline</i> Perfil</a></li>
              <li><a class="grey-text text-darken-1" href="app-chat.html"><i class="material-icons">chat_bubble_outline</i> Chat</a></li>
              <li><a class="grey-text text-darken-1" href="page-faq.html"><i class="material-icons">help_outline</i> Ajuda</a></li>
              <li class="divider"></li>
              <li><a class="grey-text text-darken-1" href="user-lock-screen.html"><i class="material-icons">lock_outline</i> Bloquear</a></li>
              <li><a class="grey-text text-darken-1" href="/usuario/logout"><i class="material-icons">keyboard_tab</i> Sair</a></li>
            </ul>
            <!-- Fim Perfil do dropdown-->
          </div>
          <nav class="display-none search-sm">
            <div class="nav-wrapper">
              <form>
                <div class="input-field">
                  <input class="search-box-sm" type="search" required="" id="search">
                  <label class="label-icon" for="search"><i class="material-icons search-sm-icon">search</i></label><i class="material-icons search-sm-close">close</i>
                </div>
              </form>
            </div>
          </nav>
        </nav>
      </div>
    </header>
    <!-- Fim: Header-->

    <!-- Início: SideNav-->
    <aside class="sidenav-main nav-expanded nav-lock nav-collapsible sidenav-light sidenav-active-square">
      <div class="brand-sidebar">
        <h1 class="logo-wrapper"><a class="brand-logo darken-1" href="/admin"><span class="logo-text hide-on-med-and-down">Agência Seguros</span></a></h1>
      </div>
      <ul class="sidenav sidenav-collapsible leftside-navigation collapsible sidenav-fixed menu-shadow" id="slide-out" data-menu="menu-navigation" data-collapsible="menu-accordion">
            <li class="bold">
              <a class="waves-effect waves-cyan" href="/admin">
                <i class="material-icons">home</i>
                <span class="menu-title">Início</span>
              </a>
            </li>
            <li class="navigation-header"><a class="navigation-header-text">Aplicação</a><i class="navigation-header-icon material-icons">more_horiz</i>
            </li>
            <li class="bold"><a class="waves-effect waves-cyan" href="/admin/segurados"><i class="material-icons">group</i><span class="menu-title" data-i18n="">Segurados</span></a>
            </li>
            <li class="bold"><a class="waves-effect waves-cyan  active red" href="/admin/propostasApolices"><i class="material-icons">insert_drive_file</i><span class="menu-title" data-i18n="">Propostas e apólices</span></a>
            </li>
            <li class="bold"><a class="collapsible-header waves-effect waves-cyan " href="#"><i class="material-icons">attach_money</i><span class="menu-title" data-i18n="">Financeiro</span></a>
              <div class="collapsible-body">
                <ul class="collapsible collapsible-sub" data-collapsible="accordion">
                  <li><a class="collapsible-body" href="/admin/financeiro/pagamentos" data-i18n=""><i class="material-icons">radio_button_unchecked</i><span>Pagamemtos</span></a>
                  </li>
                </ul>
              </div>
            </li>
            <li class="bold"><a class="collapsible-header waves-effect waves-cyan " href="#"><i class="material-icons">show_chart</i><span class="menu-title" data-i18n="">Relatorios</span></a>
             <div class="collapsible-body">
               <ul class="collapsible collapsible-sub" data-collapsible="accordion">
                 <li><a class="collapsible-body" href="/admin/relatorios/comissoes" data-i18n=""><i class="material-icons">radio_button_unchecked</i><span>Comissões</span></a>
                 <li>
               </ul>
             </div>
           </li>
           <li class="bold"><a class="collapsible-header waves-effect waves-cyan " href="#"><i class="material-icons">settings</i><span class="menu-title" data-i18n="">Configurações</span></a>
             <div class="collapsible-body">
               <ul class="collapsible collapsible-sub" data-collapsible="accordion">
                 <li><a class="collapsible-body" href="/admin/configuracoes/seguradoras" data-i18n=""><i class="material-icons">radio_button_unchecked</i><span>Seguradoras</span></a>
                 <li><a class="collapsible-body" href="/admin/configuracoes/ramos" data-i18n=""><i class="material-icons">radio_button_unchecked</i><span>Ramos</span></a>
                 </li>
                 <li><a class="collapsible-body" href="/admin/configuracoes/coberturas" data-i18n=""><i class="material-icons">radio_button_unchecked</i><span>Coberturas</span></a>
                 </li>
                 <li><a class="collapsible-body" href="/admin/configuracoes/classificacoes" data-i18n=""><i class="material-icons">radio_button_unchecked</i><span>Classificações</span></a>
                 </li>
                 <li><a class="collapsible-body" href="/admin/configuracoes/sistema" data-i18n=""><i class="material-icons">radio_button_unchecked</i><span>Sistema</span></a>
                 </li>
               </ul>
             </div>
           </li>
         </ul>
      <div class="navigation-background"></div><a class="sidenav-trigger btn-sidenav-toggle btn-floating btn-medium waves-effect waves-light hide-on-large-only" href="#" data-target="slide-out"><i class="material-icons">menu</i></a>
    </aside>
    <!-- Fim: SideNav-->

    <!-- BEGIN: Page Main-->
    <div id="main">
      <div class="row">
        <div class="content-wrapper-before gradient-45deg-indigo-purple"></div>
        <div class="col s12">
          <div class="container">

            <!-- Add new contact popup Ends-->

<!-- Sidebar Area Starts -->
<div class="sidebar-left sidebar-fixed">
  <div class="sidebar">
    <div class="sidebar-content">
      <div class="sidebar-header">
        <div class="sidebar-details col s12" style="width:50em">
          <h3 class="m-0 sidebar-title"><i class="material-icons app-header-icon text-top">insert_drive_file</i> Parcelas e Comissões
          </h3>
        </div>
        <div class="nav-wrapper" style="width:50em;padding-top: 20px;">
          <div class="col s12">
            <a  class="breadcrumb text-muted" style="font-size: 14px !important;">Negócios</a>
            <a href="/admin/propostasApolices" class="breadcrumb text-muted" style="font-size: 14px !important;">N_proposta</a>
            <a href="/admin/parcelasComissoes" class="breadcrumb text-muted" style="font-size: 14px !important;">Parcelas da proposta</a>
              <a href="/admin/parcelasComissoes" class="breadcrumb text-muted" style="font-size: 14px !important;">Cadastro de parcela</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Sidebar Area Ends -->

<!-- Início: Tabela de Segurados -->

    <div class="section">
        <div class="row">
            <div class="col s12">
                <div id="html-validations" class="card card-tabs">
                    <div class="card-content">
                        <div class="card-title">
                            <div class="row">
                                <div class="col s12 m6 l10">
                                    <h4 class="card-title">Dados Cadastrais</h4>
                                </div>
                                <div class="col s12 m6 l2">
                                </div>
                            </div>
                        </div>
                        <div id="html-view-validations">
                            <form class="formValidate0" id="formValidate0" method="post" action="/admin/parcelas/novo/mostrar">
                                <div class="row">
                                    <div class="input-field col m4 s12">
                                        <label for="n_parcela">Parcela Nº</label>
                                        <input class="validate" id="n_parcela" name="n_parcelas" type="text" value="O Nº da parcela é gerada automaticamente">
                                    </div>
                                    <div class="input-field col m4 s12">
                                        <label for="p_total">Prêmio total</label>
                                        <input class="validate" id="p_total" name="premio_total" type="number">
                                    </div>
                                    <div class="input-field col m4 s12">
                                        <label for="p_liquido">Prêmio líquido</label>
                                        <input class="validate" id="p_liquido" name="premio_liquido" type="number">
                                    </div>
                                    <div class="input-field m6 col s12">
                                        <select class="error validate" id="tipo_parcela" name="tipo_parcela" aria-required="true" required>
                                            <option value="" disabled selected>Tipo parcela?</option>
                                            <option value="1">Seguro</option>
                                        </select>
                                    </div>
                                    <div class="input-field m6 col s12">
                                        <select class="error validate" id="segurado_pagou" name="tipo_parcela" aria-required="true" required>
                                            <option value="" disabled selected>Segurado já pagou esta parcela?</option>
                                            <option value="1">Não</option>
                                            <option value="2">Sim</option>
                                        </select>
                                    </div>
                                    <div class="input-field m6 col s12">
                                        <input id="vencimento" type="text" class="" name="vencimento" value="07/11/2019">
                                        <label for="vencimento">Vencimento:</label>
                                    </div>
                                    <div class="input-field m3 col s12">
                                        <label for="porcento_comissao">% Comissão</label>
                                        <input class="validate" required aria-required="true" id="porcento_comissao" type="text" name="porcento_comissao">
                                    </div>
                                    <div class="input-field m3 col s12">
                                        <select class="error validate" id="comissa_recebida" name="comissao_recebida" aria-required="true" required>
                                            <option value="" disabled selected>Comissão já recebida?</option>
                                            <option value="1">Não</option>
                                            <option value="2">Sim</option>
                                        </select>
                                    </div>
                                <div class="input-field col s12">
                                    <button class="btn waves-effect waves-light right" type="submit">Salvar
                                        <i class="material-icons right">save</i>
                                    </button>
                                </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- Fim: Tabela de Segurados -->

<!-- Início Do Sidenav Da Direita -->
    <aside id="right-sidebar-nav">
     <div id="slide-out-right" class="slide-out-right-sidenav sidenav rightside-navigation">
        <div class="row">
           <div class="slide-out-right-title">
              <div class="col s12 border-bottom-1 pb-0 pt-1">
                 <div class="row">
                    <div class="col s2 pr-0 center">
                       <i class="material-icons vertical-text-middle"><a href="#" class="sidenav-close">clear</a></i>
                    </div>
                    <div class="col s10 pl-0">
                       <ul class="tabs">
                          <li class="tab col s6 p-0">
                             <a href="#messages" class="active">
                                <span>Mensagens</span>
                             </a>
                          </li>
                          <li class="tab col s6 p-0">
                             <a href="#activity">
                                <span>Actividades</span>
                             </a>
                          </li>
                       </ul>
                    </div>
                 </div>
              </div>
           </div>
           <div class="slide-out-right-body">
              <div id="messages" class="col s12">
                 <div class="collection border-none">
                    <input class="header-search-input mt-4 mb-2" type="text" required name="Search" placeholder="Procurar Mensagens" />
                    <ul class="collection p-0">
                       <li class="collection-item sidenav-trigger display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                          <span class="avatar-status avatar-online avatar-50"
                             ><img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar" />
                             <i></i>
                          </span>
                          <div class="user-content">
                             <h6 class="line-height-0">Elizabeth Elliott</h6>
                             <p class="medium-small blue-grey-text text-lighten-3 pt-3">Obrigado</p>
                          </div>
                          <span class="secondary-content medium-small">5.00 AM</span>
                       </li>
                       <li class="collection-item sidenav-trigger display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                          <span class="avatar-status avatar-online avatar-50"
                             ><img src="/res/admin/assets/images/avatar/avatar-1.png" alt="avatar" />
                             <i></i>
                          </span>
                          <div class="user-content">
                             <h6 class="line-height-0">Eithan Keanue</h6>
                             <p class="medium-small blue-grey-text text-lighten-3 pt-3">Olá Oconner</p>
                          </div>
                          <span class="secondary-content medium-small">4.14 AM</span>
                       </li>
                    </ul>
                 </div>
              </div>
              <div id="activity" class="col s12">
                 <div class="activity">
                    <p class="mt-5 mb-0 ml-5 font-weight-900">Logs do Sistema</p>
                    <ul class="collection with-header">
                       <li class="collection-item">
                          <div class="font-weight-900">
                             Iniciaste sessão <span class="secondary-content">Agora mesmo</span>
                          </div>
                          <span class="new badge amber" data-badge-caption="Importante"> </span>
                       </li>
                       <li class="collection-item">
                          <div class="font-weight-900">
                             Melissa . <span class="secondary-content">10 mins</span>
                          </div>
                          <p class="mt-0 mb-2">Here are some news feed interactions concepts.</p>
                          <span class="new badge light-green" data-badge-caption="Resolvido"></span>
                       </li>
                    </ul>
                    <p class="mt-5 mb-0 ml-5 font-weight-900">Logs Da Aplicação</p>
                    <ul class="collection with-header">
                       <li class="collection-item">
                          <div class="font-weight-900">
                             New order received urgent <span class="secondary-content">Just now</span>
                          </div>
                          <p class="mt-0 mb-2">Melissa liked your activity.</p>
                       </li>
                       <li class="collection-item">
                          <div class="font-weight-900">System shutdown. <span class="secondary-content">5 min</span></div>
                          <p class="mt-0 mb-2">Here are some news feed interactions concepts.</p>
                          <span class="new badge blue" data-badge-caption="Urgent"> </span>
                       </li>
                       <li class="collection-item">
                          <div class="font-weight-900">
                             Database overloaded 89% <span class="secondary-content">20 min</span>
                          </div>
                          <p class="mt-0 mb-2">Here are some news feed interactions concepts.</p>
                       </li>
                    </ul>
                    <p class="mt-5 mb-0 ml-5 font-weight-900">Logs Do Servidor</p>
                    <ul class="collection with-header">
                       <li class="collection-item">
                          <div class="font-weight-900">System error <span class="secondary-content">10 min</span></div>
                          <p class="mt-0 mb-2">Melissa liked your activity.</p>
                       </li>
                       <li class="collection-item">
                          <div class="font-weight-900">
                             Production server down. <span class="secondary-content">1 hrs</span>
                          </div>
                          <p class="mt-0 mb-2">Here are some news feed interactions concepts.</p>
                          <span class="new badge blue" data-badge-caption="Urgent"></span>
                       </li>
                    </ul>
                 </div>
              </div>
           </div>
        </div>
     </div>

     <!-- Chat Do Slide De Saída -->
     <ul id="slide-out-chat" class="sidenav slide-out-right-sidenav-chat">
        <li class="center-align pt-2 pb-2 sidenav-close chat-head">
           <a href="#!"><i class="material-icons mr-0">chevron_left</i>Elizabeth Elliott</a>
        </li>
        <li class="chat-body">
           <ul class="collection">
              <li class="collection-item display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                 <span class="avatar-status avatar-online avatar-50"
                    ><img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar" />
                 </span>
                 <div class="user-content speech-bubble">
                    <p class="medium-small">hello!</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar justify-content-end pl-5 pb-0" data-target="slide-out-chat">
                 <div class="user-content speech-bubble-right">
                    <p class="medium-small">How can we help? We're here for you!</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                 <span class="avatar-status avatar-online avatar-50"
                    ><img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar" />
                 </span>
                 <div class="user-content speech-bubble">
                    <p class="medium-small">I am looking for the best admin template.?</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar justify-content-end pl-5 pb-0" data-target="slide-out-chat">
                 <div class="user-content speech-bubble-right">
                    <p class="medium-small">Materialize admin is the responsive materializecss admin template.</p>
                 </div>
              </li>

              <li class="collection-item display-grid width-100 center-align">
                 <p>8:20 a.m.</p>
              </li>

              <li class="collection-item display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                 <span class="avatar-status avatar-online avatar-50"
                    ><img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar" />
                 </span>
                 <div class="user-content speech-bubble">
                    <p class="medium-small">Ohh! very nice</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar justify-content-end pl-5 pb-0" data-target="slide-out-chat">
                 <div class="user-content speech-bubble-right">
                    <p class="medium-small">Thank you.</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                 <span class="avatar-status avatar-online avatar-50"
                    ><img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar" />
                 </span>
                 <div class="user-content speech-bubble">
                    <p class="medium-small">How can I purchase it?</p>
                 </div>
              </li>

              <li class="collection-item display-grid width-100 center-align">
                 <p>9:00 a.m.</p>
              </li>

              <li class="collection-item display-flex avatar justify-content-end pl-5 pb-0" data-target="slide-out-chat">
                 <div class="user-content speech-bubble-right">
                    <p class="medium-small">From ThemeForest.</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar justify-content-end pl-5 pb-0" data-target="slide-out-chat">
                 <div class="user-content speech-bubble-right">
                    <p class="medium-small">Only $24</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                 <span class="avatar-status avatar-online avatar-50"
                    ><img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar" />
                 </span>
                 <div class="user-content speech-bubble">
                    <p class="medium-small">Ohh! Thank you.</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar pl-5 pb-0" data-target="slide-out-chat">
                 <span class="avatar-status avatar-online avatar-50"
                    ><img src="/res/admin/assets/images/avatar/avatar-7.png" alt="avatar" />
                 </span>
                 <div class="user-content speech-bubble">
                    <p class="medium-small">I will purchase it for sure.</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar justify-content-end pl-5 pb-0" data-target="slide-out-chat">
                 <div class="user-content speech-bubble-right">
                    <p class="medium-small">Great, Feel free to get in touch on</p>
                 </div>
              </li>
              <li class="collection-item display-flex avatar justify-content-end pl-5 pb-0" data-target="slide-out-chat">
                 <div class="user-content speech-bubble-right">
                    <p class="medium-small">https://pixinvent.ticksy.com/</p>
                 </div>
              </li>
           </ul>
        </li>
        <li class="center-align chat-footer">
           <form class="col s12" onsubmit="slide_out_chat()" action="javascript:void(0);">
              <div class="input-field">
                 <input id="icon_prefix" type="text" class="search" />
                 <label for="icon_prefix">Type here..</label>
                 <a onclick="slide_out_chat()"><i class="material-icons prefix">send</i></a>
              </div>
           </form>
        </li>
     </ul>
  </aside>
  <!-- Fim Do Sidenav Da Direita -->

          </div>
        </div>
      </div>
    </div>
    <!-- END: Page Main-->

      <!-- Início: Footer-->

    <footer class="page-footer footer footer-static footer-dark red gradient-shadow navbar-border navbar-shadow">
      <div class="footer-copyright">
        <div class="container"><span>&copy; 2019
          <a href="https://etc.com" target="_blank">Seguradora Angola</a> Todos sistemas reservados.</span><span class="right hide-on-small-only">Desenvolvido por <a href="https://ap-acap.com">ACAP</a></span></div>
      </div>
    </footer>

    <!-- Fim: Footer-->

    <!-- BEGIN VENDOR JS-->
    <script src="/res/admin/assets/js/app-email/vendors.min.js" type="text/javascript"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script src="/res/admin/assets/vendors/data-tables/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="/res/admin/assets/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN THEME  JS-->
    <script src="/res/admin/assets/js/plugins.js" type="text/javascript"></script>
    <script src="/res/admin/assets/js/custom/custom-script.js" type="text/javascript"></script>
    <script src="/res/admin/assets/js/scripts/customizer.js" type="text/javascript"></script>
    <!-- END THEME  JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="/res/admin/assets/js/scripts/app-contacts.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL JS-->

    <script src="/res/admin/assets/js/app-email/vendors.min.js" type="text/javascript"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script src="/res/admin/assets/vendors/data-tables/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="/res/admin/assets/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN THEME  JS-->
    <script src="/res/admin/assets/js/plugins.js" type="text/javascript"></script>
    <!-- END THEME  JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="/res/admin/assets/js/scripts/data-tables.js" type="text/javascript"></script>
    <script src="/res/admin/assets/js/scripts/form-masks.js" type="text/javascript"></script>
    <script src="/res/admin/assets/vendors/formatter/jquery.formatter.min.js"></script>
    <!-- END PAGE LEVEL JS-->
