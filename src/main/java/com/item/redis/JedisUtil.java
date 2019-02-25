package com.item.redis;

import redis.clients.jedis.Jedis;

public class JedisUtil {
	
	public Jedis connectJedis() {
		
		Jedis jedis = new Jedis("127.0.0.1",6379);
		return jedis;
	}

}
