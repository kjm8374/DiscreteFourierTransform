function make_plot(x_data,y_data,graph_title,x_label,y_label,x2_data,y2_data,y2_marker)
global fig_num;
  figure(fig_num);
  fig_num = fig_num + 1;
  plot(x_data,y_data);
  grid on;
  xlabel(x_label); ylabel(y_label);
  title(graph_title);
if nargin==8
      hold on;
      plot(x2_data,y2_data,y2_marker);
end
end