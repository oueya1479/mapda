package kosta.mapda.domain.map;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private LocalDateTime regDate;
	private String content;
	private String name;
	private int listSize;
}
