package Bean;

public class Buku{
	private int bukuID;
	private String judul;
	private String pengarang;
	private String penerbit;
	private int jumlah;

	public void setBukuID(int bukuID){
		this.bukuID = bukuID;
	}
	public int getBukuID(){
		return bukuID;
	}

	public void setJudul(String judul){
		this.judul = judul;
	}
	public String getJudul(){
		return judul;
	}

	public void setPengarang(String pengarang){
		this.pengarang = pengarang;
	}
	public String getPengarang(){
		return pengarang;
	}

	public void setPenerbit(String penerbit){
		this.penerbit = penerbit;
	}
	public String getPenerbit(){
		return penerbit;
	}

	public void setJumlah(int jumlah){
		this.jumlah = jumlah;
	}
	public int getJumlah(){
		return jumlah;
	}
}