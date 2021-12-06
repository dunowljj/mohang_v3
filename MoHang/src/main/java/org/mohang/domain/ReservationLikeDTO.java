package org.mohang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationLikeDTO {
	private GeneralMyReservationDTO myReservationDTO;
	private LikedVO likedVO;
}
