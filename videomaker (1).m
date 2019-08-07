vidObj = VideoWriter('epsilon_1000.avi'); % Name it.
vidObj.FrameRate = 60; % How many frames per second.
open(vidObj); 


data = importdata('graphingdata.csv')
theta= importdata('graphingdata_2.csv')

for i=1:(1000*(20))
    plot(data.data(i,:),'k')
    ylim([0 100])
    xlim([1 25])
    xlabel('Compartment') 
    ylabel('Volume')
    title(['Time = ' num2str(floor(i*0.05))]);
    hold on
    thet = theta.data(i, :)';
    c=[(2*pi-thet)/(2*pi), 0.25*ones(25,1), (thet)/(2*pi)];
    scatter(1:25,data.data(i,:), 70 , c,'filled');
    set(gca,'FontSize',15);
    hold off
    currFrame = getframe(gcf);   
    writeVideo(vidObj,currFrame);
end

close(vidObj);