/*
* Solution
*/
package kata
import "unicode"
func ToAlternatingCase(str string) string {
	runes := []rune(str)
	for i, r := range runes {
		if unicode.IsLower(r) {
			runes[i] = unicode.ToUpper(r)
		} else if unicode.IsUpper(r) {
			runes[i] = unicode.ToLower(r)
		}
	}
	return string(runes)
}





/*
* Sample Tests
*/
// Ginkgo BDD Testing Framework <http://onsi.github.io/ginkgo></http:>
// Gomega Matcher Library <http://onsi.github.io/gomega></http:>

package kata_test
import (
  . "github.com/onsi/ginkgo"
  . "github.com/onsi/gomega"
  . "codewarrior/kata"
)
var _ = Describe("Test Example", func() {
  It("basic tests", func() {
    Expect(ToAlternatingCase("hello world")).To(Equal("HELLO WORLD"))
    Expect(ToAlternatingCase("HELLO WORLD")).To(Equal("hello world"))
    Expect(ToAlternatingCase("hello WORLD")).To(Equal("HELLO world"))
    Expect(ToAlternatingCase("HeLLo WoRLD")).To(Equal("hEllO wOrld"))
    Expect(ToAlternatingCase("12345")).To(Equal("12345"))
    Expect(ToAlternatingCase("1a2b3c4d5e")).To(Equal("1A2B3C4D5E"))
    Expect(ToAlternatingCase("String.prototype.toAlternatingCase")).To(Equal("sTRING.PROTOTYPE.TOaLTERNATINGcASE"))
    Expect(ToAlternatingCase(ToAlternatingCase("Hello World"))).To(Equal("Hello World"))
    Expect(ToAlternatingCase("altERnaTIng cAsE")).To(Equal("ALTerNAtiNG CaSe"))
    Expect(ToAlternatingCase("ALTerNAtiNG CaSe")).To(Equal("altERnaTIng cAsE"))
    Expect(ToAlternatingCase("altERnaTIng cAsE <=> ALTerNAtiNG CaSe")).To(Equal("ALTerNAtiNG CaSe <=> altERnaTIng cAsE"))
    Expect(ToAlternatingCase("ALTerNAtiNG CaSe <=> altERnaTIng cAsE")).To(Equal("altERnaTIng cAsE <=> ALTerNAtiNG CaSe"))
  })
})