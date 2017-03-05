
/*************** BUSCAR EL idLote A MODIFICAR ******************************/

SELECT * FROM `lotes` 


/****************** LIMPIAR CEDULAS GENERADAS PARA UN LOTE ****************/


UPDATE `lotespersonas` SET `NroCedula` = null, `FechaNotificacion` = null,
`FechaRecepcionDDJJ` = null, `FechaIntimacion` = null, `AptoJurado` = null,
`idTipoImpedimento` = null, `ObservacionesImpedimento` = null, `idEstadoDDJJ` = 1,
`idTipoResultado` = null, `ObservacionesEstado` = null, `CargaWeb` = 0
WHERE idLote = #NroIdLote#


DELETE FROM `notificaciones` WHERE idLote = #NroIdLote#