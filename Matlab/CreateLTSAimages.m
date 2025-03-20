%save images of Triton ltsas each hour

    %set new datetime
    t1 = timenum('07/11/2023 20:00:00',6); %First hour of deployment
    t2 = timenum('07/16/2023 15:00:00',6); %Last hour of deployment
    StartTimes = t1:hours(1):t2;
    
    for t = 1:length(StartTimes) 
        PARAMS.ltsa.plot.dnum = datenum(StartTimes(t));
        read_ltsadata
        plot_triton

        PNGName = sprintf('%s%s%s','CalCurCeas_test_',datestr(StartTimes(t),'yyyymmdd'),'.png')
        saveas(gca,PNGName)
    end