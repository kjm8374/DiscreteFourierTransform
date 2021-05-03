function make_stem(m,cm,graph_title,x_label,y_label)
  global fig_num;
  figure(fig_num);
  fig_num = fig_num + 1;
  
  stem(m,abs(cm),'b'); 
  grid on; 
  xlabel(x_label); 
  ylabel(y_label);
  title(graph_title); 
end