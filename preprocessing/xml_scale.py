from cell_count_analysis.cell_3d import cell_io

ratio_x = 1.2 # you have to figure this one out
ratio_y = 1.2 # you have to figure this one out
transform_params = (ratio_x, ratio_y)
cell_io.transform_xml_file("/media/rancze/RanczLabTV1/final_analysis/ERAA10_4h_analysis/n_count_python_ch02/cells.xml", "/media/rancze/RanczLabTV1/final_analysis/ERAA10_4h_analysis/n_count_python_ch02/cells_scaled.xml", transform_params)
