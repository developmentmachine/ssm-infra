package github.developmentmachine.ssm.pojo;

import java.util.ArrayList;
import java.util.List;

public class XtreeData {
	private String title;
	private String value;
	private Boolean checked=false;
	private Boolean disabled;
	private List<XtreeData> data=new ArrayList<>();
	
	public XtreeData(String title, String value, Boolean checked, List<XtreeData> data) {
		super();
		this.title = title;
		this.value = value;
		this.checked = checked;
		this.data = data;
	}
	public XtreeData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public List<XtreeData> getData() {
		return data;
	}
	public void setData(List<XtreeData> data) {
		this.data = data;
	}
	public Boolean getDisabled() {
		return disabled;
	}
	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}
	
	
}
