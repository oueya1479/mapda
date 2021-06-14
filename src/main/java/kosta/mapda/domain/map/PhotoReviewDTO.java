package kosta.mapda.domain.map;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PhotoReviewDTO {
	private LocalDateTime regDate;
	private String name;
	private String content;
	private int star;
	private int listSize;
	private List<PlacePhotoReviewPhoto> pathList;
}
