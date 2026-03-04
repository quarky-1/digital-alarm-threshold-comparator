clc; clear; close all;

%% Initial Setup
n_rooms = 4;
n_samples = 100;
data = rand(n_rooms, n_samples) * 100;
threshold_warning = 50;
threshold_critical = 70;

disp('Voice-Activated Digital Alarm System');

while true
    %% Start/Stop Prompt
    disp('Say "start" to begin monitoring, or "stop" to exit.');
    cmd = string(py.voice_command.listen_command());
    disp("You said: " + cmd);

    if strcmpi(cmd, 'stop') || strcmpi(cmd, 'end')
        disp('Exiting program...');
        break;
    elseif ~strcmpi(cmd, 'start')
        disp('Unrecognized command. Please say "start" or "stop".');
        continue;
    end

    %% Room Selection
    disp('Available rooms: Room 1, Room 2, Room 3, Room 4');
    disp('Say which room to monitor (e.g., "Room 2")');

    while true
        cmd = string(py.voice_command.listen_command());
        disp("You said: " + cmd);

        if strcmpi(cmd, "room 1")
            room = 1; break;
        elseif strcmpi(cmd, "room 2")
            room = 2; break;
        elseif strcmpi(cmd, "room 3")
            room = 3; break;
        elseif strcmpi(cmd, "room 4")
            room = 4; break;
        else
            disp('Please say: "Room 1", "Room 2", "Room 3", or "Room 4"');
        end
    end

    disp(['Monitoring Room ', num2str(room)]);

    %% Process Room Data
    room_data = data(room, :);

    alarm_level = strings(1, n_samples);
    for i = 1:n_samples
        if room_data(i) > threshold_critical
            alarm_level(i) = "Critical";
        elseif room_data(i) > threshold_warning
            alarm_level(i) = "Warning";
        else
            alarm_level(i) = "Normal";
        end
    end

    n_critical = sum(alarm_level == "Critical");
    n_warning  = sum(alarm_level == "Warning");
    n_normal   = sum(alarm_level == "Normal");

    %% What to view
    disp('What would you like to see?');
    disp('Say: "sensor readings", "bar graph", or "everything"');

    while true
        cmd = string(py.voice_command.listen_command());
        disp("You said: " + cmd);

        if any(strcmpi(cmd, {'sensor readings', 'bar graph', 'everything'}))
            break;
        else
            disp('Please say: "sensor readings", "bar graph", or "everything"');
        end
    end

    %% Show outputs
    if strcmpi(cmd, 'sensor readings') || strcmpi(cmd, 'everything')
        figure;
        plot(room_data, '-o', 'MarkerSize', 4, 'DisplayName', 'Sensor Data');
        hold on;
        plot(find(alarm_level=="Critical"), room_data(alarm_level=="Critical"), 'rx', 'MarkerSize', 8, 'LineWidth', 1.5, 'DisplayName', 'Critical');
        plot(find(alarm_level=="Warning"), room_data(alarm_level=="Warning"), 'gx', 'MarkerSize', 8, 'LineWidth', 1.5, 'DisplayName', 'Warning');
        yline(threshold_warning, '--g', 'Warning Threshold');
        yline(threshold_critical, '--r', 'Critical Threshold');
        xlabel('Time Sample');
        ylabel('Sensor Reading');
        title(sprintf('Room %d Sensor Readings with Alarms', room));
        legend();
        grid on;
    end

    if strcmpi(cmd, 'bar graph') || strcmpi(cmd, 'everything')
        figure;
        bar([n_normal n_warning n_critical],'FaceColor','flat');
        set(gca,'XTickLabel',{'Normal','Warning','Critical'});
        ylabel('Count');
        title(sprintf('Room %d Alarm Level Counts', room));
        grid on;
    end

    %% End of session message
    disp('Session complete.');
    disp('Say "start" to monitor another room, or "stop" to exit.');
end

disp('Program exited.');
