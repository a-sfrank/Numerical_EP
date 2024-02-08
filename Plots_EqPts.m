function []= Plots_EqPts(NEq,Code,Eq_pts,labels)        
for j=1:NEq
    if Code(j)==0|| Code(j)==3 || Code(j)==5
       plot3(Eq_pts(j,1),Eq_pts(j,2),Eq_pts(j,3),'gs','Color','g','MarkerSize',18,...
    'MarkerFaceColor','g')  
    elseif Code(j)==1 || Code(j)==2 ||   Code(j)==4 
        plot3(Eq_pts(j,1),Eq_pts(j,2),Eq_pts(j,3),'ro','Color','r','MarkerSize',18,...
    'MarkerFaceColor','r')
     end
end
%legend(labels(1:NEq,1))
end
   

