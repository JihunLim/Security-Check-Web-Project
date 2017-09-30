package egovframework.security.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(UserService.class); 

	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException{
	    logger.info("username : " + username);
		//회원정보 dao에서 데이터를 UserDetail에 로드시킴
	    
		
		// TODO Auto-generated method stub
		return null;
	}

}
