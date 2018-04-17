package util;

public class Pagination {
	private int yeNum;//һҳ��ʾ��������
	//���㿪ʼҳ�ͽ���ҳ
	private int begin;
	private int end;
	//��ǰҳ
	private int ye;
	//���ҳ
	private int maxYe;
	private int yeMa;//һҳ��ʾ���ٸ�,��1-5��1-10

	public Pagination(int ye,int max,int yeNum,int yeMa){
		this.ye=ye;
		this.yeNum=yeNum;
		this.yeMa=yeMa;
		Col(max);
	}
	public void Col(int max){
		//��֤��С��ҳ�ǵ�һҳ��
				if(ye<1){
					ye=1;
				}
				this.maxYe=max%yeNum==0?max/yeNum:max/yeNum+1;
				//��֤����ҳ�����һҳ
				if(ye>maxYe){
					ye=maxYe;
				}
				
				
				
				  	begin=ye-yeMa/2;
				 	end=ye+yeMa/2;
				 	if(begin<1){
				 	begin=1;
				 	end=yeMa;
				 	}
				 	if(end>maxYe){
				 	end=maxYe;
				 	begin=maxYe-yeMa+1;
				 	}
				 	//�������ҳС��ҳ��
				 	if(maxYe<yeMa){
				 		begin=1;
				 		end=maxYe;
				 	}
	}
	
	
	public int getPageNum() {
		return yeNum;
	}

	public void setPageNum(int pageNum) {
		this.yeNum = pageNum;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getYe() {
		return ye;
	}

	public void setYe(int ye) {
		this.ye = ye;
	}

	public int getMaxYe() {
		return maxYe;
	}

	public void setMaxYe(int maxYe) {
		this.maxYe = maxYe;
	}
}
