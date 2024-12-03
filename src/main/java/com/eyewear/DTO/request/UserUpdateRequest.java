package com.eyewear.DTO.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserUpdateRequest {
    String password;
    String phone;
    String firstName;
    String lastName;
    String province;
    String district;
    String commue;
    String streetName;
    String streetNumber;
    String picture;
}
