package middleware.middlewareDomain;

import Dominio.ICurso;


public class MWDegreeTranslation  
{
	private String degreeCode;
	private Integer keyDegree;
	private ICurso degree;	

	/**
	 * @return
	 */
	public ICurso getDegree()
	{
		return this.degree;
	}

	/**
	 * @param degree
	 */
	public void setDegree(ICurso degree)
	{
		this.degree = degree;
	}

	/**
	 * @return
	 */
	public String getDegreeCode()
	{
		return this.degreeCode;
	}

	/**
	 * @param degreeCode
	 */
	public void setDegreeCode(String degreeCode)
	{
		this.degreeCode = degreeCode;
	}

	/**
	 * @return
	 */
	public Integer getKeyDegree()
	{
		return this.keyDegree;
	}

	/**
	 * @param keyDegree
	 */
	public void setKeyDegree(Integer keyDegree)
	{
		this.keyDegree = keyDegree;
	}

}
