package com.tm.cgv.redis;

import org.json.JSONException;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisTest {
 
    @Autowired
    RedisTemplate<String, Object> redisTemplate;
 
    //@Test
    public void redisBasicFunction_guide() throws JSONException {
        //Given
        String key = "iamkey";
        String value = "iamvalue";
        
        // redis에 set
        redisTemplate.opsForValue().set(key, value);
        
        // redis에서 get
        String result = (String) redisTemplate.opsForValue().get(key);
        System.out.println(result);
        
        // redis에서 data delete
        //redisTemplate.delete(key);
        
        // redis에 해당 key를 가지고 있는지 확인
        if (!redisTemplate.hasKey("iamkey")) {
            System.out.println("key 미존재");
        }
    }
}
