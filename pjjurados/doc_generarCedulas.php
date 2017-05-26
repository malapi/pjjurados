<?php
include ("header.php");
$arCedula = "";
$arSobre = "";
$id = "";
if ($_GET) {
    $id = $_GET ["id"];
}
?>

<!-- Content -->
<div id="content">
    <!-- Content wrapper -->
    <div class="wrapper">
        <!-- Breadcrumbs line -->
        <div class="crumbs">
            <ul id="breadcrumbs" class="breadcrumb">
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Nominas</a></li>
            </ul>
        </div>
        <!-- /breadcrumbs line -->

        <!-- Page header -->
        <div class="page-header">
            <div class="page-title">
                <h5>Generar C&eacute;dulas de Notificaci&oacute;n</h5>
                <span></span>
            </div>
        </div>
        <!-- /page header -->

        <div class="span12" id="divNueva">
            <form id="formSorteo">
                <fieldset>
                    <!-- General form elements -->
                    <div class="widget row-fluid">						
                        <div class="navbar">
                            <div class="navbar-inner">
                                <h6>Nomina</h6>
                            </div>
                        </div>
                        <div class="well">
                            <div class="row-fluid">
                                <div class="span8">
                                    <div class="control-group">
                                        <label class="control-label">Descripci&oacute;n:</label>
                                        <div class="controls">
                                            <input type="text" id="txtDescripcion" name="txtDescripcion"
                                                   class="span12" />
                                        </div>
                                    </div>
                                </div>
                                <div class="span2">
                                    <div class="control-group">
                                        <label class="control-label">Fecha Inicio:</label>
                                        <div class="controls">
                                            <input type="text" class="span12"
                                                   data-mask="99/99/9999" id="txtFechaDesde"
                                                   name="txtFechaDesde" placeholder="99/99/9999">
                                        </div>
                                    </div>
                                </div>
                                <div class="span2">
                                    <div class="control-group">
                                        <label class="control-label">Fecha Finalizaci&oacute;n:</label>
                                        <div class="controls">
                                            <input type="text" class="span12"
                                                   data-mask="99/99/9999" id="txtFechaHasta"
                                                   name="txtFechaHasta" placeholder="99/99/9999" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="control-group">
                                    <label class="control-label">Observaciones:</label>
                                    <div class="controls">
                                        <textarea id="txtObs" name="txtObs" class="span12" rows="2"></textarea>
                                    </div>
                                </div>
                            </div>	
                            <div id="respuestaPlantilla"></div>
                        </div>
                    </div>
                    <!-- /general form elements -->
                </fieldset>
            </form>
            <!-- /basic inputs -->
        </div>

        <div class="widget">
            <div class='navbar'>
                <div class='navbar-inner'>
                    <h6>Datos para C&eacute;dula de Notificaci&oacute;n</h6>
                </div>
            </div>
            <form id="formGenerarCedulas" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="oper" id="oper" value="generarCedula" /> <input
                    type="hidden" name="hfIdSorteo" id="hfIdSorteo" value="<?php echo $id; ?>" />
                <fieldset>
                    <!-- General form elements -->
                    <div class="widget row-fluid">	
                        <div class="well">
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="control-group">
                                        <label class="control-label">Iniciar Nro C&eacute;dula en:</label>
                                        <div class="controls">
                                            <input type="text" class="span2" id="txtNroCedula" name="txtNroCedula" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="control-group">
                                        <label class="control-label">Modelo Para C&eacute;dula Notificaci&oacute;n:</label>
                                        <div class="controls" >
                                            <div id="upload" class="btn btn-primary"><span><i class="ico-file"> </i> Adjuntar Modelo </span></div>
                                            <span id="status" ></span>	
                                            <span id="resultado" ></span>
                                            <input type="hidden" name="hfArchiCedula" id="hfArchiCedula" value="<?php echo $arCedula; ?>" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="control-group">
                                        <label class="control-label">Modelo Para Sobres Notificaci&oacute;n:</label>
                                        <div class="controls" >
                                            <div id="uploadSo" class="btn btn-primary"><span><i class="ico-file"> </i> Adjuntar Modelo Sobres </span></div>
                                            <span id="statusSo" ></span>	
                                            <span id="resultadoSo" ></span>
                                            <input type="hidden" name="hfArchiSobre" id="hfArchiSobre" value="<?php echo $arSobre; ?>" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="control-group">
                                        <label class="control-label">Carta de Saludo:</label>
                                        <div class="controls" >
                                            <textarea name="txtCarta" id="txtCarta"></textarea> 
                                            <input type="hidden" name="hfCartaSaludo" id="hfCartaSaludo" value="" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="respuestaCe"></div>
                            <div class="form-actions align-right">
                                <button id="btnGenerarCedula" type="button"
                                        class="btn btn-info">Generar C&eacute;dulas</button>
                                <a id="btnImprimirCedula" href="lot_listadoParaDocumentacion.php"
                                   class="btn btn-info" style="display: none;">Imprimir C&eacute;dulas</a>	
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>

            <div id="listadoDatos" class='table-overflow'></div>
        </div>

    </div>
    <!-- /content wrapper -->

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/plugins/ajaxupload.3.5.js"></script>
<script type="text/javascript" src="js/generarCedula.js"></script>
