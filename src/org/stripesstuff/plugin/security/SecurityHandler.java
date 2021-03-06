package org.stripesstuff.plugin.security;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.Resolution;

import java.lang.reflect.Method;


/**
 * Optional interface that can be implemented by a SecurityManager to determine what to do when access
 * has been denied.
 *
 * @author <a href="mailto:xf2697@fastmail.fm">Fred Daoud</a>
 * @version $Id: SecurityHandler.java,v 1.1 2008-10-22 10:18:19 Kani Exp $
 */
public interface SecurityHandler
{
	/**
	 * Determines what to do when access has been denied.
	 *
	 * @param bean    the action bean to which access was denied
	 * @param handler the event handler to which access was denied
	 * @return the Resolution to be executed when access has been denied
	 */
	Resolution handleAccessDenied(ActionBean bean, Method handler);
}
