package org.stripesstuff.plugin.jstl;

import net.sourceforge.stripes.config.ConfigurableComponent;
import net.sourceforge.stripes.config.Configuration;
import net.sourceforge.stripes.localization.DefaultLocalizationBundleFactory;

import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;


/**
 * Default implementation of {@link ResourceBundleFactory}. Looks for a configuration parameter in
 * the bootstrap property called "ResourceBundleFactory.Bundle". If this value is not specified the default bundle name
 * of "StripesResources" will be used in its place (or rather the default bundle used by
 * {@link net.sourceforge.stripes.localization.DefaultLocalizationBundleFactory}).
 *
 * @author <a href="mailto:kindop@xs4all.nl">Oscar Westra van Holthe - Kind</a>
 * @version $Id: DefaultResourceBundleFactory.java,v 1.1 2008-10-22 10:18:20 Kani Exp $
 */
public class DefaultResourceBundleFactory
		implements ResourceBundleFactory, ConfigurableComponent
{
	/**
	 * The base name of the resource bundle.
	 */
	private String baseName = DefaultLocalizationBundleFactory.BUNDLE_NAME;


	/**
	 * Initialize the bundle factory.
	 *
	 * @param configuration the current configuration
	 * @throws Exception when the factory cannot be initialized
	 */
	public void init(Configuration configuration)
			throws Exception
	{
		String baseName = configuration.getBootstrapPropertyResolver().getProperty("ResourceBundleFactory.Bundle");
		if (baseName != null)
		{
			this.baseName = baseName;
		}
	}


	/**
	 * Returns the ResourceBundle from which to messages for the specified locale by default.
	 *
	 * @param locale the locale that is in use for the current request
	 * @return the default resource bundle
	 * @throws java.util.MissingResourceException
	 *          when a bundle that is expected to be present cannot be located
	 */
	public ResourceBundle getDefaultBundle(Locale locale)
			throws MissingResourceException
	{
		ResourceBundle bundle;
		if (locale == null)
		{
			bundle = ResourceBundle.getBundle(baseName);
		}
		else
		{
			bundle = ResourceBundle.getBundle(baseName, locale);
		}

		return bundle;
	}
}
