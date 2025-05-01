%save images of Triton ltsas each hour


global PARAMS


    %set new datetime
    t1 = timenum('11/11/2024 02:00:00',6); %First hour of deployment
    t2 = timenum('11/24/2024 14:00:00',6); %Last hour of deployment
    StartTimes = t1:hours(1):t2;
    
set(gcf, 'Position', [-1.4490   -0.2325    0.8781    1.1458])

cd('C:\Users\annes\Documents\CalCurCEAS\CalCurCeas_024')
   for t = 1:length(StartTimes) 
        PARAMS.ltsa.plot.dnum = datenum(StartTimes(t));
        read_ltsadata
        plot_triton

        PNGName = sprintf('%s%s%s','CalCurCeas_024_',datestr(StartTimes(t),'yyyymmdd_HHMM'),'.png')
        saveas(gca,PNGName)
    end