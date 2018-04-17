package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import entity.Order;
import entity.User;

public interface OrderDao {
	public int addOrder(Order order);
	public int addOrderMap(@Param(value="oId")int oId,@Param(value="pId")int pId,@Param(value="num")int num);
	public List<Order> showOrder(String number);
	public int delOrder(@Param(value="orderId")int orderId, @Param(value="uId")int uId);
	public int delOrderMap(@Param(value="orderId")int orderId);
	public List<Order> searchNumber(@Param(value="uId")int uId);
}
