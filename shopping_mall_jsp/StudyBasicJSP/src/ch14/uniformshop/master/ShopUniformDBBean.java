package ch14.uniformshop.master;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ShopUniformDBBean {
	
    private static ShopUniformDBBean instance 
                          = new ShopUniformDBBean();
    
    public static ShopUniformDBBean getInstance() {
        return instance;
    }
    
    private ShopUniformDBBean() {}
    
    //  커넥션풀로부터 커넥션객체를 얻어내는 메소드
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
        return ds.getConnection();
    }
    
    //  관리자 인증 메소드
    public int managerCheck(String id, String passwd) 
	throws Exception {
		Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs= null;
        String dbpasswd="";
		int x=-1;
        
		try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select managerPasswd from manager where managerId = ? ");
            pstmt.setString(1, id);
            
            rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("managerPasswd"); 
				if(dbpasswd.equals(passwd))
					x= 1; //인증 성공
				else
					x= 0; //비밀번호 틀림
			}else
				x= -1;//해당 아이디 없음
			
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
	}
    
    //책 등록 메소드
    public void insertUniform(ShopUniformDataBean uniform) 
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"insert into uniform values (?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1,uniform.getUniform_id());
            pstmt.setString(2, uniform.getUniform_kind());
            pstmt.setString(3, uniform.getUniform_title());
            pstmt.setInt(4, uniform.getUniform_price());
            pstmt.setShort(5, uniform.getUniform_count());
            pstmt.setString(6, uniform.getTeam());
            pstmt.setString(7, uniform.getLaunch_com());
			pstmt.setString(8, uniform.getLaunch_date());
			pstmt.setString(9, uniform.getUniform_image());
			pstmt.setString(10, uniform.getUniform_content());
			pstmt.setByte(11,uniform.getDiscount_rate());
			pstmt.setTimestamp(12, uniform.getReg_date());
			
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
        
	// 전체등록된 책의 수를 얻어내는 메소드
	public int getUniformCount()
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from uniform");
            rs = pstmt.executeQuery();

            if (rs.next()) 
               x= rs.getInt(1);
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
	
	// 분류별또는 전체등록된 책의 정보를 얻어내는 메소드
	public List<ShopUniformDataBean> getUniforms(String uniform_kind)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ShopUniformDataBean> uniformList=null;
        
        try {
            conn = getConnection();
            
            String sql1 = "select * from uniform";
            String sql2 = "select * from uniform ";
            sql2 += "where uniform_kind = ? order by reg_date desc";
            
            if(uniform_kind.equals("all")){
            	 pstmt = conn.prepareStatement(sql1);
            }else{
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, uniform_kind);
            }
        	rs = pstmt.executeQuery();
            
            if (rs.next()) {
                uniformList = new ArrayList<ShopUniformDataBean>();
                do{
                     ShopUniformDataBean uniform= new ShopUniformDataBean();
                     
                     uniform.setUniform_id(rs.getInt("uniform_id"));
                     uniform.setUniform_kind(rs.getString("uniform_kind"));
                     uniform.setUniform_title(rs.getString("uniform_title"));
                     uniform.setUniform_price(rs.getInt("uniform_price"));
                     uniform.setUniform_count(rs.getShort("uniform_count"));
                     uniform.setTeam(rs.getString("team"));
                     uniform.setLaunch_com(rs.getString("launch_com"));
                     uniform.setLaunch_date(rs.getString("launch_date"));
                     uniform.setUniform_image(rs.getString("uniform_image"));
                     uniform.setDiscount_rate(rs.getByte("discount_rate"));
                     uniform.setReg_date(rs.getTimestamp("reg_date"));
                     
                     uniformList.add(uniform);
			    }while(rs.next());
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return uniformList;
    }
	
	// 쇼핑몰 메인에 표시하기 위해서 사용하는 분류별 신간책목록을 얻어내는 메소드
	public ShopUniformDataBean[] getUniforms(String uniform_kind,int count)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ShopUniformDataBean uniformList[]=null;
        int i=0;
        
        try {
            conn = getConnection();
            
            String sql = "select * from uniform where uniform_kind = ? ";
            sql += "order by reg_date desc limit ?,?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uniform_kind);
            pstmt.setInt(2, 0);
            pstmt.setInt(3, count);
        	rs = pstmt.executeQuery();

            if (rs.next()) {
                uniformList = new ShopUniformDataBean[count];
                do{
                     ShopUniformDataBean uniform= new ShopUniformDataBean();
                     uniform.setUniform_id(rs.getInt("uniform_id"));
                     uniform.setUniform_kind(rs.getString("uniform_kind"));
                     uniform.setUniform_title(rs.getString("uniform_title"));
                     uniform.setUniform_price(rs.getInt("uniform_price"));
                     uniform.setUniform_count(rs.getShort("uniform_count"));
                     uniform.setTeam(rs.getString("team"));
                     uniform.setLaunch_com(rs.getString("launch_com"));
                     uniform.setLaunch_date(rs.getString("launch_date"));
                     uniform.setUniform_image(rs.getString("uniform_image"));
                     uniform.setDiscount_rate(rs.getByte("discount_rate"));
                     uniform.setReg_date(rs.getTimestamp("reg_date"));
                     
                     uniformList[i]=uniform;
                     
                     i++;
			    }while(rs.next());
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return uniformList;
    }
	
	// uniformId에 해당하는 책의 정보를 얻어내는 메소드로 
    //등록된 책을 수정하기 위해 수정폼으로 읽어들기이기 위한 메소드
	public ShopUniformDataBean getUniform(int uniformId)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ShopUniformDataBean uniform=null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select * from uniform where uniform_id = ?");
            pstmt.setInt(1, uniformId);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                uniform = new ShopUniformDataBean();
                
                uniform.setUniform_kind(rs.getString("uniform_kind"));
                uniform.setUniform_title(rs.getString("uniform_title"));
                uniform.setUniform_price(rs.getInt("uniform_price"));
                uniform.setUniform_count(rs.getShort("uniform_count"));
                uniform.setTeam(rs.getString("team"));
                uniform.setLaunch_com(rs.getString("launch_com"));
                uniform.setLaunch_date(rs.getString("launch_date"));
                uniform.setUniform_image(rs.getString("uniform_image"));
                uniform.setUniform_content(rs.getString("uniform_content"));
                uniform.setDiscount_rate(rs.getByte("discount_rate"));
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return uniform;
    }
    
    // 등록된 책의 정보를 수정시 사용하는 메소드
    public void updateUniform(ShopUniformDataBean uniform, int uniformId)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql;
        
        try {
            conn = getConnection();
            
            sql = "update uniform set uniform_kind=?,uniform_title=?,uniform_price=?";
            sql += ",uniform_count=?,team=?,launch_com=?,launch_date=?";
            sql += ",uniform_image=?,uniform_content=?,discount_rate=?";
            sql += " where uniform_id=?";
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, uniform.getUniform_kind());
            pstmt.setString(2, uniform.getUniform_title());
            pstmt.setInt(3, uniform.getUniform_price());
            pstmt.setShort(4, uniform.getUniform_count());
            pstmt.setString(5, uniform.getTeam());
            pstmt.setString(6, uniform.getLaunch_com());
			pstmt.setString(7, uniform.getLaunch_date());
			pstmt.setString(8, uniform.getUniform_image());
			pstmt.setString(9, uniform.getUniform_content());
			pstmt.setByte(10, uniform.getDiscount_rate());
			pstmt.setInt(11, uniformId);
            
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    // uniformId에 해당하는 책의 정보를 삭제시 사용하는 메소드
    public void deleteUniform(int uniformId)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement(
            	"delete from uniform where uniform_id=?");
            pstmt.setInt(1, uniformId);
            
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
}