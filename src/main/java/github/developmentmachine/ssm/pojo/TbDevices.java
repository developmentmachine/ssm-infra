package github.developmentmachine.ssm.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class TbDevices {

    private String gpsdata;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    public String getGpsdata() {
        return gpsdata;
    }

    public void setGpsdata(String gpsdata) {
        this.gpsdata = gpsdata;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
