package com.ruoyi.common.utils.security;

import java.util.Random;
import java.util.UUID;

/**
 * ID工具类，用于生成唯一标识
 * */
public class IDUtil {
  private static String baseNum = "0123456789";
  private static String baseString = "abcdefghijklmnopqrstuvwxyz0123456789";
	/**
	 * 获取唯一标识UUID
	 * */
	public static String getID() {
		UUID id = UUID.randomUUID();
		return id.toString().replaceAll("-", "");
	}

	public static UUID parseUUID(String id) {
		if (id.length() == 32) {
			String[] components = new String[5];
			components[0] = "0x" + id.substring(0, 8);
			components[1] = "0x" + id.substring(8, 12);
			components[2] = "0x" + id.substring(12, 16);
			components[3] = "0x" + id.substring(16, 20);
			components[4] = "0x" + id.substring(20);
			long mostSigBits = Long.decode(components[0]).longValue();
			mostSigBits <<= 16;
			mostSigBits |= Long.decode(components[1]).longValue();
			mostSigBits <<= 16;
			mostSigBits |= Long.decode(components[2]).longValue();

			long leastSigBits = Long.decode(components[3]).longValue();
			leastSigBits <<= 48;
			leastSigBits |= Long.decode(components[4]).longValue();

			return new UUID(mostSigBits, leastSigBits);
		}
		return UUID.fromString(id);
	}

  /**
   * 获取随机字符串
   *
   * @param step
   * @return
   */
  public static String getRandom(int step, RandomEnum randomEnum) {

    String base = "";
    if (randomEnum == (RandomEnum.I)) {
      base = baseNum;
    } else {
      base = baseString;
    }
    return getString(step, base);
  }

  /**
   * 方法重载
   *
   * @param step
   * @return
   */
  public static String getRandom(int step) {
    return getRandom(step, RandomEnum.S);
  }

  private static String getString(int step, String base) {
    Random random = new Random();
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < step; i++) {
      int number = random.nextInt(base.length());
      sb.append(base.charAt(number));
    }
    return sb.toString();
  }

  public enum RandomEnum {
    S, //字符串类型
    I, //数字类型
    T //时间戳类型
  }

}
