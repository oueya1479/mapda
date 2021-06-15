package kosta.mapda.repository.member;

import java.sql.SQLException;
import java.util.List;

public interface LikesRepository {
	public List<LikesRepository> selectLikes(Long memNo) throws SQLException;

}
