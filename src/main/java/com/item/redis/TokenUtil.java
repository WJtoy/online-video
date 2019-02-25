package com.item.redis;

import java.util.UUID;

import redis.clients.jedis.Jedis;

public class TokenUtil {
	
	 public TokenModel createToken(Integer userId) {
	        //使用uuid作为源token
	        String token = UUID.randomUUID().toString().replace("-", "");
	        TokenModel model = new TokenModel(userId, token);
	        String id=Integer.toString(userId);
	        Jedis jedis = new Jedis("127.0.0.1",6379);
	        jedis.flushAll();
	        jedis.set(token, id);
	        System.out.println(token);
	        //存储到redis并设置过期时间
	        return model;
	    }

}
