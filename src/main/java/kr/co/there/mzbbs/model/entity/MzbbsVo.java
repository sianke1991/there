package kr.co.there.mzbbs.model.entity;

import java.util.Date;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Getter
//@Setter
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class MzbbsVo {
	private int magazine_idx;
	private String magazine_subject;
	private Date magazine_date;
	private int magazine_viewcnt;
	private String magazine_content;
	private String magazine_thumb;
	private String magazine_hashtag;

	public MzbbsVo() {}//

	public MzbbsVo(int magazine_idx, String magazine_subject, Date magazine_date, int magazine_viewcnt,
			String magazine_content, String magazine_thumb, String magazine_hashtag) {
		super();
		this.magazine_idx = magazine_idx;
		this.magazine_subject = magazine_subject;
		this.magazine_date = magazine_date;
		this.magazine_viewcnt = magazine_viewcnt;
		this.magazine_content = magazine_content;
		this.magazine_thumb = magazine_thumb;
		this.magazine_hashtag = magazine_hashtag;
	}

	public int getMagazine_idx() {
		return magazine_idx;
	}

	public void setMagazine_idx(int magazine_idx) {
		this.magazine_idx = magazine_idx;
	}

	public String getMagazine_subject() {
		return magazine_subject;
	}

	public void setMagazine_subject(String magazine_subject) {
		this.magazine_subject = magazine_subject;
	}

	public Date getMagazine_date() {
		return magazine_date;
	}

	public void setMagazine_date(Date magazine_date) {
		this.magazine_date = magazine_date;
	}

	public int getMagazine_viewcnt() {
		return magazine_viewcnt;
	}

	public void setMagazine_viewcnt(int magazine_viewcnt) {
		this.magazine_viewcnt = magazine_viewcnt;
	}

	public String getMagazine_content() {
		return magazine_content;
	}

	public void setMagazine_content(String magazine_content) {
		this.magazine_content = magazine_content;
	}

	public String getMagazine_thumb() {
		return magazine_thumb;
	}

	public void setMagazine_thumb(String magazine_thumb) {
		this.magazine_thumb = magazine_thumb;
	}

	public String getMagazine_hashtag() {
		return magazine_hashtag;
	}

	public void setMagazine_hashtag(String magazine_hashtag) {
		this.magazine_hashtag = magazine_hashtag;
	}

	@Override
	public String toString() {
		return "MzbbsVo [magazine_idx=" + magazine_idx + ", magazine_subject=" + magazine_subject + ", magazine_date="
				+ magazine_date + ", magazine_viewcnt=" + magazine_viewcnt + ", magazine_content=" + magazine_content
				+ ", magazine_thumb=" + magazine_thumb + ", magazine_hashtag=" + magazine_hashtag + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(magazine_content, magazine_date, magazine_hashtag, magazine_idx, magazine_subject,
				magazine_thumb, magazine_viewcnt);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if ((obj == null) || (getClass() != obj.getClass()))
			return false;
		MzbbsVo other = (MzbbsVo) obj;
		return Objects.equals(magazine_content, other.magazine_content)
				&& Objects.equals(magazine_date, other.magazine_date)
				&& Objects.equals(magazine_hashtag, other.magazine_hashtag) && magazine_idx == other.magazine_idx
				&& Objects.equals(magazine_subject, other.magazine_subject)
				&& Objects.equals(magazine_thumb, other.magazine_thumb) && magazine_viewcnt == other.magazine_viewcnt;
	}


}
