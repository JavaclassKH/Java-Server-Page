package admin.complain;

public class ComplainVO {
	private int idx;
	private String part;
	private int partIdx;
	private String cpMid;
	private String cpContent;
	private String cpDate;	
	
	
	private String title;
	private String mid;
	private String NickName;
	private String complain;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getPartIdx() {
		return partIdx;
	}
	public void setPartIdx(int partIdx) {
		this.partIdx = partIdx;
	}
	public String getCpMid() {
		return cpMid;
	}
	public void setCpMid(String cpMid) {
		this.cpMid = cpMid;
	}
	public String getCpContent() {
		return cpContent;
	}
	public void setCpContent(String cpContent) {
		this.cpContent = cpContent;
	}
	public String getCpDate() {
		return cpDate;
	}
	public void setCpDate(String cpDate) {
		this.cpDate = cpDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return NickName;
	}
	public void setNickName(String nickName) {
		NickName = nickName;
	}
	public String getComplain() {
		return complain;
	}
	public void setComplain(String complain) {
		this.complain = complain;
	}
	
	@Override
	public String toString() {
		return "ComplainVO [idx=" + idx + ", part=" + part + ", partIdx=" + partIdx + ", cpMid=" + cpMid + ", cpContent="
				+ cpContent + ", cpDate=" + cpDate + ", title=" + title + ", mid=" + mid + ", NickName=" + NickName
				+ ", complain=" + complain + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
