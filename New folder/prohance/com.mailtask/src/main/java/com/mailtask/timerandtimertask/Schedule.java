package com.mailtask.timerandtimertask;

import java.util.TimerTask;

import com.mailtask.mailsender.MailSender;



import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class Schedule {
	
	
	public void scheduleTask(String startDateTime, int gap, String timeUnit,String fileType,String report) {
        try {
           
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            Date startDate = dateTimeFormat.parse(startDateTime);
            Calendar current = Calendar.getInstance();

            
            Calendar startCal = Calendar.getInstance();
            startCal.setTime(startDate);

            
            if (startCal.before(current)) {
                System.out.println("Start time must be in the future.");
                return;
            }

            
            long delay = startCal.getTimeInMillis() - current.getTimeInMillis();
            final long interval;

          
            switch (timeUnit.toLowerCase()) {
                case "minutes":
                    interval = gap * 60 * 1000L; // Convert minutes to milliseconds
                    break;
                case "hours":
                    interval = gap * 60 * 60 * 1000L; // Convert hours to milliseconds
                    break;
                case "days":
                    interval = gap * 24 * 60 * 60 * 1000L; // Convert days to milliseconds
                    break;
                case "months":
                    interval = gap * 30L * 24 * 60 * 60 * 1000L; // Approximate months to milliseconds
                    break;
                default:
                    throw new IllegalArgumentException("Invalid time unit. Use 'minutes', 'hours', 'days', or 'months'.");
            }

            // Schedule the task
            Timer timer = new Timer();
            timer.scheduleAtFixedRate(new TimeProcessor(fileType,report) {
                public void run() {
                    super.run();
                    showNextSchedule(timeUnit, interval);
                }
            }, delay, interval);

         
            showNextSchedule(timeUnit, interval);

            System.out.println("Mail scheduled to start at: " + dateTimeFormat.format(startCal.getTime()) +
                               " and repeat every " + gap + " " + timeUnit + ".");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void showNextSchedule(String intervalName, long intervalInMillis) {
        
        Calendar current = Calendar.getInstance();

        Calendar nextSchedule = (Calendar) current.clone();
        nextSchedule.add(Calendar.MILLISECOND, (int) intervalInMillis);

       
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String nextTime = dateFormat.format(nextSchedule.getTime());

      
        System.out.println("Next Mail Send  (" + intervalName + "): " + nextTime);
    }
    

}

	
	


