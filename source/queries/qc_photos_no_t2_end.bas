﻿dbMemo "SQL" ="SELECT qc_plot_visits.Unit_Code, qc_plot_visits.Plot_ID, qc_plot_visits.Start_Da"
    "te, qc_plot_visits.Vegetation_Type\015\012FROM qc_plot_visits LEFT JOIN qc_photo"
    "s_t2_end ON (qc_plot_visits.Unit_Code = qc_photos_t2_end.Unit_Code) AND (qc_plot"
    "_visits.Plot_ID = qc_photos_t2_end.Plot_ID) AND (qc_plot_visits.Start_Date = qc_"
    "photos_t2_end.Start_Date) AND (qc_plot_visits.Vegetation_Type = qc_photos_t2_end"
    ".Vegetation_Type)\015\012WHERE (((qc_plot_visits.Vegetation_Type)=\"forest\" \015"
    "\012OR (qc_plot_visits.Vegetation_Type)=\"woodland\" \015\012OR (qc_plot_visits."
    "Vegetation_Type)=\"oak scrub\") \015\012AND ((qc_photos_t2_end.Unit_Code) Is Nul"
    "l))\015\012ORDER BY qc_plot_visits.Unit_Code, qc_plot_visits.Plot_ID, qc_plot_vi"
    "sits.Start_Date;\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
Begin
End