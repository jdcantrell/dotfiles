<?php
/**
 * Verifies that control statements conform to their coding standards.
 *
 * PHP version 5
 *
 * @category  PHP
 * @package   PHP_CodeSniffer
 * @author    Greg Sherwood <gsherwood@squiz.net>
 * @author    Marc McIntyre <mmcintyre@squiz.net>
 * @copyright 2006-2012 Squiz Pty Ltd (ABN 77 084 670 600)
 * @license   https://github.com/squizlabs/PHP_CodeSniffer/blob/master/licence.txt BSD Licence
 * @link      http://pear.php.net/package/PHP_CodeSniffer
 */

if (class_exists('PHP_CodeSniffer_Standards_AbstractPatternSniff', true) === false) {
    throw new PHP_CodeSniffer_Exception('Class PHP_CodeSniffer_Standards_AbstractPatternSniff not found');
}

/**
 * Verifies that control statements conform to their coding standards.
 *
 * @category  PHP
 * @package   PHP_CodeSniffer
 * @author    Greg Sherwood <gsherwood@squiz.net>
 * @author    Marc McIntyre <mmcintyre@squiz.net>
 * @copyright 2006-2012 Squiz Pty Ltd (ABN 77 084 670 600)
 * @license   https://github.com/squizlabs/PHP_CodeSniffer/blob/master/licence.txt BSD Licence
 * @version   Release: 1.5.0RC2
 * @link      http://pear.php.net/package/PHP_CodeSniffer
 */
class Trulia_Sniffs_ControlStructures_ControlSignatureSniff extends Squiz_Sniffs_ControlStructures_ControlSignatureSniff
{
    /**
     * Returns the patterns that this test wishes to verify.
     *
     * @return array(string)
     */
    protected function getPatterns()
    {
        return array(
                'tryEOL...{...}EOL...catch (...)EOL...{',
                'doEOL...{...}EOL...while (...);EOL',
                'while (...)EOL...{',
                'for (...)EOL...{',
                'if (...)EOL...{',
                'foreach (...)EOL...{',
                '}EOL...else if (...)EOL...{',
                '}EOL...elseif (...)EOL...{',
                '}EOL...elseEOL...{',
               );

    }//end getPatterns()


}//end class

?>